/*
* Copyright (C) 2016 The OmniROM Project
*
* This program is free software: you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation, either version 2 of the License, or
* (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
* GNU General Public License for more details.
*
* You should have received a copy of the GNU General Public License
* along with this program. If not, see <http://www.gnu.org/licenses/>.
*
*/
package com.slim.device.settings;

import android.content.ContentResolver;
import android.content.Context;
import android.content.SharedPreferences;
import android.support.v14.preference.PreferenceFragment;
import android.support.v7.preference.Preference;
import android.support.v7.preference.PreferenceManager;
import android.support.v7.preference.PreferenceViewHolder;
import android.database.ContentObserver;
import android.util.AttributeSet;
import android.view.View;
import android.widget.SeekBar;
import android.widget.Button;
import android.os.Bundle;
import android.util.Log;
import android.os.Vibrator;

import com.slim.device.R;
import com.slim.device.settings.Utils;

public class VibratorStrengthPreference extends PreferenceFragment implements
        SeekBar.OnSeekBarChangeListener {

    private SeekBar mSeekBar;
    private int mOldStrength;
    private int mMinValue;
    private int mMaxValue;
    private Vibrator mVibrator;

    private static final String FILE_LEVEL_SDM = "/sys/class/leds/vibrator/vmax_mv_user";
    private static final String FILE_LEVEL_MSM = "/sys/devices/virtual/timed_output/vibrator/vmax_mv_user";
    private static final long testVibrationPattern[] = {0,250};

    public static String getFile() {
        if (Utils.fileWritable(FILE_LEVEL_SDM)) {
            return FILE_LEVEL_SDM;
        } else if (Utils.fileWritable(FILE_LEVEL_MSM)) {
            return FILE_LEVEL_MSM;
        } else {
        return null;
        }
    }

    public VibratorStrengthPreference(Context context, AttributeSet attrs) {
        super(context, attrs);
        // from drivers/platform/msm/qpnp-haptic.c
        // #define QPNP_HAP_VMAX_MIN_MV		116
        // #define QPNP_HAP_VMAX_MAX_MV		3596
        mMinValue = 116;
        mMaxValue = 2088;

        mVibrator = (Vibrator) context.getSystemService(Context.VIBRATOR_SERVICE);
        setLayoutResource(R.layout.preference_seek_bar);
    }

    @Override
    public void onBindViewHolder(PreferenceViewHolder holder) {
        super.onBindViewHolder(holder);

        mOldStrength = Integer.parseInt(getValue(getContext()));
        mSeekBar = (SeekBar) holder.findViewById(R.id.seekbar);
        mSeekBar.setMax(mMaxValue - mMinValue);
        mSeekBar.setProgress(mOldStrength - mMinValue);
        mSeekBar.setOnSeekBarChangeListener(this);
    }

    public static boolean isSupported() {
        return Utils.fileWritable(getFile());
    }

    public static String getValue(Context context) {
        return Utils.getFileValue(getFile(), "2088");
    }

    private void setValue(String newValue, boolean withFeedback) {
        Utils.writeValue(getFile(), newValue);
        SharedPreferences.Editor editor = PreferenceManager.getDefaultSharedPreferences(getContext()).edit();
        editor.putString(ButtonSettingsFragment.KEY_VIBSTRENGTH, newValue);
        editor.commit();
        if (withFeedback) {
            mVibrator.vibrate(testVibrationPattern, -1);
        }
    }

    public static void restore(Context context) {
        if (!isSupported()) {
            return;
        }

        String storedValue = PreferenceManager.getDefaultSharedPreferences(context).getString(ButtonSettingsFragment.KEY_VIBSTRENGTH, "2088");
        Utils.writeValue(getFile(), storedValue);
    }

    public void onProgressChanged(SeekBar seekBar, int progress,
            boolean fromTouch) {
        setValue(String.valueOf(progress + mMinValue), true);
    }

    public void onStartTrackingTouch(SeekBar seekBar) {
        // NA
    }

    public void onStopTrackingTouch(SeekBar seekBar) {
        // NA
    }
}

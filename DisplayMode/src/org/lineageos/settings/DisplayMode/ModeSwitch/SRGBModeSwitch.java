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
package org.lineageos.settings.DisplayMode;

import android.content.Context;
import android.content.SharedPreferences;
import android.support.v7.preference.Preference;
import android.support.v7.preference.Preference.OnPreferenceChangeListener;
import android.support.v7.preference.PreferenceManager;

import org.lineageos.settings.DisplayMode.DeviceSettings;

public class SRGBModeSwitch implements OnPreferenceChangeListener {

    private static final String FILE_SDM = "/sys/devices/platform/soc/ae00000.qcom,mdss_mdp/drm/card0/card0-DSI-1/SRGB";
    private static final String FILE_MSM = "/sys/devices/virtual/graphics/fb0/SRGB";

    public static boolean isSupported() {
        return Utils.fileWritable(getFile(FILE_SDM)) || Utils.fileWritable(getFile(FILE_MSM));
    }

    public static boolean isCurrentlyEnabled(Context context) {
        return Utils.getFileValueAsBoolean(getFile(), false);
    }

    private static boolean isSDM() {
        if (Utils.fileWritable(getFile(FILE_SDM))) {
            return true;
        }
        return false;
    }
    @Override
    public boolean onPreferenceChange(Preference preference, Object newValue) {
        Boolean enabled = (Boolean) newValue;
        Utils.writeValue(isSDM() ? getFile(FILE_SDM) : getFile(FILE_MDM), enabled ? "1" : "0");
        return true;
    }
}

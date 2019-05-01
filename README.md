Common device tree for OnePlus devices
--------------------------------------

Purpose of this repo is to group all merely common features for oneplus devices in one repo.

**Currently contains:**
- Device- and KeyHandler (Alert slider and Screen off gestures)
- Doze
- DisplayMode
- PocketMode
- additional permissions for oneplus devices (/prebuilt)
- string resources from devicesettings repo (LOS), so the dependency is not needed

**Should not contain:**
- KeyDisabler from OP5 is device specific, as this device has hardware keys.
- tri-state-key daemon from the OP6, as this is device specific to get access to the alert slider.
- Any needed node definitions for kernel paths, needed SEpolicies are currently not included.

The repo contain overlays, inits and sepolicy for the features, the java files for touchscreen etc.

**Structure:**
Get the following additions into Settings (Display and System):
- Doze settings (Doze)
- Ambient display option (under Doze settings?)
- Pocketmode settings (under Doze Settings)
- Alert Slider settings
- Off Screen Gestures
- Display modes

**Notes:**

Vibration settings might need changes in sepolicy/private/system_app.te:
    allow system_app sysfs_leds:file rw_file_perms;

On OP6 the tri-state-key daemon is still needed on devicetree.
On OP5 the keydisabler still is needed on devicetree.

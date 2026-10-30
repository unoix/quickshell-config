import QtQuick
import Quickshell
import Quickshell.Services.UPower
import qs.modules

Valuer {
    percentage: UPower.displayDevice?.percentage ?? 0

    iconSource: {
        const device = UPower.displayDevice
        
        if (!device) {
            return Quickshell.configDir + "/assets/battery-warning.svg"
        }

        // Check enum state
        if (device.state === UPowerDeviceState.Charging) {
            return Quickshell.configDir + "/assets/battery-charging.svg"
        }

        // Percentage thresholds (assuming 0 to 100 range)
        const p = device.percentage * 100
        if (p < 5)  return Quickshell.configDir + "/assets/battery-warning.svg"
        if (p < 30) return Quickshell.configDir + "/assets/battery-low.svg"
        if (p < 70) return Quickshell.configDir + "/assets/battery-medium.svg"
        return Quickshell.configDir + "/assets/battery-full.svg"
    }
}

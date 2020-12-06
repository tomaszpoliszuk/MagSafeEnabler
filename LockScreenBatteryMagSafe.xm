/* MagSafe Enabler - enables new native MagSafe charging view when connecting device to power source on iOS 14.1 and above on iOS/iPadOS
 * Copyright (C) 2020 Tomasz Poliszuk
 *
 * MagSafe Enabler is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * MagSafe Enabler is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with MagSafe Enabler. If not, see <https://www.gnu.org/licenses/>.
 */


%hook CSPowerChangeObserver
- (bool)isConnectedToWirelessInternalChargingAccessory {
	return YES;
}
- (void)setIsConnectedToWirelessInternalChargingAccessory:(bool)arg1 {
	arg1 = YES;
	%orig;
}
%end

%hook CSAccessoryConfiguration
- (CGSize)boltSize {
	CGSize size = %orig;
	size.width = 84;
	size.height = 124;
	return size;
}
- (double)ringDiameter {
	return 300;
}
- (double)splashRingDiameter {
	return 700;
}
- (double)staticViewRingDiameter {
	return 700;
}
- (double)lineWidth {
	return 24;
}
%end

%ctor {
	%init;
}

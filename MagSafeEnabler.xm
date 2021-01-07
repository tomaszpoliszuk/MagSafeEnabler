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
	if ( [UIScreen mainScreen].bounds.size.width < 321 ) {
		size.width = 72;
		size.height = 108;
	} else {
		size.width = 84;
		size.height = 124;
	}
	return size;
}
- (double)ringDiameter {
	if ( [UIScreen mainScreen].bounds.size.width < 321 ) {
		return 256;
	}
	return 300;
}
- (double)splashRingDiameter {
	if ( [UIScreen mainScreen].bounds.size.width < 321 ) {
		return 598;
	}
	return 700;
}
- (double)staticViewRingDiameter {
	if ( [UIScreen mainScreen].bounds.size.width < 321 ) {
		return 598;
	}
	return 700;
}
- (double)lineWidth {
	if ( [UIScreen mainScreen].bounds.size.width < 321 ) {
		return 20;
	}
	return 24;
}
%end

%ctor {
	%init;
}

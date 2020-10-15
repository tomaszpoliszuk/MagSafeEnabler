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
	return 300;
}
- (double)staticViewRingDiameter {
	return 300;
}
- (double)lineWidth {
	return 24;
}
%end

%ctor {
	%init;
}

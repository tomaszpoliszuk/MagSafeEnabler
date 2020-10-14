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
%end

%ctor {
	%init;
}

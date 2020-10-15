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

%hook CSChargingViewController
-(id)initWithChargingInfo:(id)info {
	[(CSBatteryChargingInfo *)info setChargingWithInternalWirelessAccessory:YES];
	%orig(info);
	return self;
}
// worth looking into:
-(long long)presentationType {
	// check what does this method returns and try to change it.
	NSLog(@"[MagCharge] presentationType: %lld",%orig);
	return %orig;
}
-(long long)presentationStyle {
	// check what does this method returns and try to change it.
	NSLog(@"[MagCharge] presentationStyle: %lld",%orig);
	return %orig;
}
%end

%ctor {
	%init;
}

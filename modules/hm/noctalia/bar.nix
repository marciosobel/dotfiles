{radius, ...}: {
  position = "right";
  density = "default";
  barType = "simple";
  showCapsule = false;
  fontScale = 1.1;
  widgetSpacing = 4;
  contentPadding = 0;
  enableExclusionZoneInset = true;
  useSeparateOpacity = false;
  marginVertical = 0;
  marginHorizontal = 0;
  frameThickness = 0;
  frameRadius = radius;
  outerCorners = true;
  widgets = {
    left = [
      {
        id = "ControlCenter";
        enableColorization = true;
        icon = "heart";
      }
      {
        id = "Workspace";
        pillSize = 0.5;
        focusedColor = "none";
        occupiedColor = "primary";
        emptyColor = "primary";
      }
    ];
    center = [
      {
        id = "Clock";
        formatHorizontal = "HH:mm";
        formatVertical = "HH mm";
        tooltipFormat = "HH:mm ddd, MMM dd";
      }
    ];
    right = [
      {id = "MediaMini";}
      {
        id = "Tray";
        chevronColor = "none";
        colorizeIcons = true;
        drawerEnabled = false;
      }
      {
        id = "NotificationHistory";
        unreadBadgeColor = "error";
      }
      {id = "Bluetooth";}
      {id = "Battery";}
      {id = "Brightness";}
      {id = "Volume";}
      {id = "Network";}
    ];
  };
}

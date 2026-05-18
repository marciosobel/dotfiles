{
  position = "right";
  density = "compact";
  barType = "framed";
  showCapsule = false;
  fontScale = 1.1;
  widgetSpacing = 4;
  contentPadding = 0;
  enableExclusionZoneInset = true;
  useSeparateOpacity = false;
  marginVertical = 8;
  marginHorizontal = 8;
  frameThickness = 8;
  frameRadius = 0;
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
      {id = "SystemMonitor";}
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

#!bin/bash
sleep 5
xinput set-prop 'CURRENT_TOCHPAD_DEVICE_NAME' 'Synaptics Scrolling Distance' -150 -150
xinput set-prop 'CURRENT_TOCHPAD_DEVICE_NAME'  'Synaptics Tap Action' 2, 3, 0, 0, 1, 3, 0
xinput set-prop 'CURRENT_TOCHPAD_DEVICE_NAME' 'Synaptics Two-Finger Scrolling' 1, 1
syndaemon -i 1 -t -k &
fcitx-autostart &
numlockx off &
imwheel -k &
/usr/bin/google-chrome-stable %U &
libinput-gestures-setup restart &
echo 1621 | sudo -S updatedb
STARTNUM=1
if [ ${STARTNUM} = 1 ]; then
  libinput-gestures-setup autostart &
  curl https://sh.rustup.rs -sSf | sh -s -- -y
  . $HOME/.cargo/env
  cargo install sd
fi
sed -i "s|^STARTNUM=1$|STARTNUM=2|g" $0

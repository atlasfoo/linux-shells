#!/bin/bash

read -p "Input the desired battery threshold: " limit

read -p "Input the battery control (e.g. BAT1) " battery

echo "Configurating battery threshold"

echo "[Unit]
Description=Set the battery charge threshold
After=multi-user.target
StartLimitBurst=0

[Service]
Type=oneshot
Restart=on-failure
ExecStart=/bin/bash -c 'echo $limit > /sys/class/power_supply/$battery/charge_control_end_threshold'

[Install]
WantedBy=multi-user.target" | sudo tee /etc/systemd/system/battery-charge-threshold.service

sudo systemctl daemon-reload

sudo systemctl restart battery-charge-threshold.service

read -p "battery threshold successfully updated"
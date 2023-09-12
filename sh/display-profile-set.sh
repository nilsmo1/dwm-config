#!/usr/bin/env bash

tv_not_included=dbc9737abcd3dd8dc6077a0a4629d5df22f3bd60
tv_included=df22874386070e1885000dc948a4f3d64dd76671
id="$(xfconf-query -c displays -p /ActiveProfile)"

[[ $id = $tv_included ]] && toggle=$tv_not_included || toggle=$tv_included

xfconf-query --create -c displays -p /Schemes/Apply -t string -s $toggle
xfconf-query -c displays -p /ActiveProfile -s $toggle
xfconf-query -c displays -p /Schemes/Apply -r

#!/bin/sh

/usr/bin/aconnect 'Arturia MiniLab mkII' 'Midi Through'
/usr/bin/aconnect 'Midi Through' 'Arturia MiniLab mkII'
/usr/bin/aconnect 'Elektron Digitakt' 'Midi Through'
/usr/bin/aconnect 'Midi Through' 'Elektron Digitakt'
/usr/bin/aconnect DeepMind12 'Midi Through'
/usr/bin/aconnect 'Midi Through' DeepMind12
/usr/bin/aconnect mio 'Midi Through'
/usr/bin/aconnect 'Midi Through' mio

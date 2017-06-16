#!/bin/sh

/usr/bin/aconnect 'Arturia MiniLab mkII' 'Elektron Digitakt'
/usr/bin/aconnect 'Arturia MiniLab mkII' DeepMind12
/usr/bin/aconnect 'Arturia MiniLab mkII' 'Midi Through'
/usr/bin/aconnect 'Arturia MiniLab mkII' mio
/usr/bin/aconnect 'Elektron Digitakt' DeepMind12
/usr/bin/aconnect 'Elektron Digitakt' mio
/usr/bin/aconnect DeepMind12 'Elektron Digitakt'
/usr/bin/aconnect DeepMind12 'Midi Through'
/usr/bin/aconnect DeepMind12 mio
/usr/bin/aconnect mio 'Elektron Digitakt'

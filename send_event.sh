#!/bin/bash


#######################
# Pest detection status
PEST_INITIALIZED=0

PEST_IN_SIGHT=10
PEST_IN_RANGE=20
PEST_OUT_SIGHT=30
PEST_OUT_RANGE=40


#########################
# Deterrent device status
BOT_INITIALIZED=0

# device action mode
BOT_PATROL=10
BOT_RETURN=1
BOT_FIRE=1
BOT_PURSUIT=1
BOT_RELOCATE=1

# device health
BOT_AMMO_LOW=1
BOT_AMMO_EMPTY=1
BOT_BATT_LOW=1
BOT_VOLT_LOW=1
BOT_VOLT_HIGH=1
BOT_COMM_LOST=1
BOT_COMM_REGAINED=1
BOT_OVERHEAT=1
BOT_OVERHEAT_END=1
BOT_OVERHUMID=1
BOT_OVERHUMID_END=1

# device errors
BOT_ERROR=1
BOT_ERROR_ALIGN=1
BOT_ERROR_VISION=1


##################################

#curl -i -X PUT https://api-m2x.att.com/v2/devices/4526ba24fa3/streams/pest/value -H "X-M2X-KEY: 70e9368ff53c2493043b42b9d437173f" -H "Content-Type: application/json" -d "{ \"value\": \"1000\" }"

DEVICE_ID='4526ba24fa3'
M2X_KEY='70e9368ff53c2493043b42b9d437173f'

STREAM_PEST_STATUS='pest_detect_status'
STREAM_BOT_ACTION='bot_action'
STREAM_BOT_HEALTH='bot_health'
STREAM_BOT_ERROR='bot_error'

val="$PEST_IN_SIGHT" #TODO: take from arg
stream="$STREAM_PEST_STATUS" # TODO: take from arg
curl -i -X PUT "https://api-m2x.att.com/v2/devices/$DEVICE_ID/streams/$stream/value" -H "X-M2X-KEY: $M2X_KEY" -H "Content-Type: application/json" -d "{ \"value\": \"$val\" }"

echo "End send event"


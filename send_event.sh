#!/bin/bash
#
# send_event.sh
#
# Usage:
#   ./send_event.sh pest_detect pest_in_sight
#

#######################
# Pest detection status
PEST_INITIALIZED=1
PEST_INITIALIZED_TEXT="Pest detector initialized"

PEST_IN_SIGHT=10
PEST_IN_RANGE=20
PEST_OUT_SIGHT=30
PEST_OUT_RANGE=40

PEST_IN_SIGHT_TXT="Pest in sight"
PEST_IN_RANGE_TXT="Pest in range"
PEST_OUT_SIGHT_TXT="Pest out of sight"
PEST_OUT_RANGE_TXT="Pest out of range"


#########################
# Deterrent device status
BOT_INITIALIZED=1
BOT_INITIALIZED_TXT="Pest deterrent bot initalized"

# device action mode
BOT_RETURN=10
BOT_RELOCATE=20
BOT_PATROL=30
BOT_PURSUIT=40
BOT_FIRE=50

BOT_RETURN_TXT="Bot returning home"
BOT_RELOCATE_TXT="Bot relocating"
BOT_PATROL_TXT="Bot patrolling"
BOT_PURSUIT_TXT="Bot pursuing target"
BOT_FIRE_TXT="Bot firing deterrent"

# device health
BOT_AMMO_LOW=10
BOT_AMMO_EMPTY=15
BOT_BATT_LOW=20
BOT_BATT_EMPTY=25
BOT_VOLT_LOW=30
BOT_VOLT_HIGH=35
BOT_COMM_LOST=40
BOT_COMM_REGAINED=45
BOT_OVERHEAT=50
BOT_OVERHEAT_END=55
BOT_OVERHUMID=60
BOT_OVERHUMID_END=65

BOT_AMMO_LOW_TXT="Bot ammo low"
BOT_AMMO_EMPTY_TXT="Bot ammo empty"
BOT_BATT_LOW_TXT="Bot battery low"
BOT_BATT_EMPTY_TXT="Bot battery empty"
BOT_VOLT_LOW_TXT="Bot voltage low"
BOT_VOLT_HIGH_TXT="Bot voltage high"
BOT_COMM_LOST_TXT="Bot communication lost"
BOT_COMM_REGAINED_TXT="Bot communication regained"
BOT_OVERHEAT_TXT="Bot overheating"
BOT_OVERHEAT_END_TXT="Bot overheating subsided"
BOT_OVERHUMID_TXT="Bot overly humid"
BOT_OVERHUMID_END_TXT="Bot no longer overly humid"

# device errors
BOT_ERROR=10
BOT_ERROR_ALIGN=20
BOT_ERROR_VISION=30

BOT_ERROR_TXT="Bot error"
BOT_ERROR_ALIGN_TXT="Bot alignment error"
BOT_ERROR_VISION_TXT="Bot vision error"


##################################

#curl -i -X PUT https://api-m2x.att.com/v2/devices/4526ba24fa3/streams/pest/value -H "X-M2X-KEY: 70e9368ff53c2493043b42b9d437173f" -H "Content-Type: application/json" -d "{ \"value\": \"1000\" }"

DEVICE_ID='4526ba45bc85b8fafeba859d5fd24fa3'
M2X_KEY='70e9368ff53c2493043b42b9d437173f'

STREAM_PEST_DETECT='pest_detect'
STREAM_BOT_ACTION='bot_action'
STREAM_BOT_HEALTH='bot_health'
STREAM_BOT_ERROR='bot_error'

# Create streams if they don't already exist
function create_streams {
  for stream_name in $STREAM_PEST_DETECT $STREAM_BOT_ACTION $STREAM_BOT_HEALTH $STREAM_BOT_ERROR; do
    display_name=`echo $stream_name | sed 's|_| |g' | sed 's|\b[a-z]|\U&|g' `
echo "Creating stream $display_name ($stream_name), and also it's text version"
curl -i -X PUT "https://api-m2x.att.com/v2/devices/$DEVICE_ID/streams/$stream_name" -H "X-M2X-KEY: $M2X_KEY" -H "Content-Type: application/json" -d "{ \"display_name\": \"$display_name\" }"
curl -i -X PUT "https://api-m2x.att.com/v2/devices/$DEVICE_ID/streams/${stream_name}_text" -H "X-M2X-KEY: $M2X_KEY" -H "Content-Type: application/json" -d "{ \"display_name\": \"$display_name Text\", \"type\": \"alphanumeric\" }"
  done 
}
#create_streams

# Send event
arg1=`echo $1 | sed 's|.|\U&|g'`
arg2=`echo $2 | sed 's|.|\U&|g'`
val_var="$arg2"
valtxt_var="${val_var}_TEXT"
stream_var="STREAM_${arg1}"
val="${!val_var}"
stream="${!stream_var}"
[ -z "$val" ] || [ -z "$stream" ] && echo "send_event.sh expects 2 valid arguments" && exit 1
valstr="Bot #1: ${!valtxt_var}"
echo "val=$val"
echo "stream=$stream"
echo "valstr=$valstr"

curl -i -X PUT "https://api-m2x.att.com/v2/devices/$DEVICE_ID/streams/$stream/value" -H "X-M2X-KEY: $M2X_KEY" -H "Content-Type: application/json" -d "{ \"value\": \"$val\" }"
curl -i -X PUT "https://api-m2x.att.com/v2/devices/$DEVICE_ID/streams/${stream}_text/value" -H "X-M2X-KEY: $M2X_KEY" -H "Content-Type: application/json" -d "{ \"value\": \"$valstr\" }"

echo "End send event"


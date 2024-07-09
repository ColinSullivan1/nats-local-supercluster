#!/bin/bash

ps -aef | grep "nats-server.*region" | grep -v grep | awk '{print $2}' | xargs kill

#!/bin/sh

if [ -z "$1" ]; then
    sed "s/External Withdrawal - //g" | sed "s/External Deposit - //g" | sed "s/POS Signature Purchase -  //g" | sed "s/Point Of Sale Deposit -  /g"
elif [ -z "$2" ]; then
    export FILENAME=`mktemp`
    sed "s/External Withdrawal - //g" <"$1" >$FILENAME && mv $FILENAME "$1"
    sed "s/External Deposit - //g" <"$1" >$FILENAME && mv $FILENAME "$1"
    sed "s/POS Signature Purchase -  //g" <"$1" >$FILENAME && mv $FILENAME "$1"
    sed "s/Point Of Sale Deposit -  //g" <"$1" >$FILENAME && mv $FILENAME "$1"
else
    cat "$1" | sed "s/External Withdrawal - //g" | sed "s/External Deposit - //g" | sed "s/POS Signature Purchase -  //g" | sed "s/Point Of Sale Deposit -  /g" >"$2"
fi

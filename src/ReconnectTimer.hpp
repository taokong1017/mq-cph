/*<copyright notice="lm-source" pids="" years="2014,2020">*/
/*******************************************************************************
 * Copyright (c) 2014,2020 IBM Corp.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
/*
 * Contributors:
 *    Rowan Lonsdale - Initial implementation
 *    Various members of the WebSphere MQ Performance Team at IBM Hursley UK
 *******************************************************************************/
/*</copyright>*/
/*******************************************************************************/
/*                                                                             */
/* Performance Harness for IBM MQ C-MQI interface                              */
/*                                                                             */
/*******************************************************************************/

#ifndef RECONNECTTIMER_HPP_
#define RECONNECTTIMER_HPP_

#include "Lock.hpp"
#include "MQIWorkerThread.hpp"
#include <stdint.h>
#include <cmqc.h>

namespace cph {

/*
 * Class: PutGet
 * -------------
 *
 * Extends: MQIWorkerThread
 *
 * Puts a message to a queue, then gets it back again.
 */
	

MQWTCLASSDEF(ReconnectTimer,
  static bool useCorrelId;
  static bool useSelector, useCustomSelector, usingPrimaryQM;
  static char customSelector[MQ_SELECTOR_LENGTH];
  static long maxReconnectTime_ms;
  static long minReconnectTime_ms;
  static int numThreadsReconnected;
  static int totalThreads;
  static char secondaryHostName[80];              //Name of machine hosting queue manager
  static unsigned int secondaryPortNumber;        //Port to connect to machine on
  static Lock rtGate;

  /*The queue to put/get to/from.*/
  MQIQueue * pQueue;
  /*The correlId to associate with messages.*/
  MQBYTE24 correlId;
  
  CPH_TIME reconnectStart;
  long reconnectTime_ms;
  char messageString[512];
  void reconnect();
)
}


#endif /* RECONNECTTIMER_HPP_ */

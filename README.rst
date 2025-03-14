Sample and benchmark scripts for pktgen (packet generator)
==========================================================
This directory contains some pktgen sample and benchmark scripts, that
can easily be copied and adjusted for your own use-case.

General doc is located in kernel: Documentation/networking/pktgen.txt

Helper include files
====================
This directory contains two helper shell files, that can be "included"
by shell source'ing.  Namely "functions.sh" and "parameters.sh".

New Scripts
-----------
I add a script to help you print pps results, named [print_result.sh](./print_results.sh). 
To use it just::

    Usage: ./print_results.sh $THREADS
        $THREADS: how many threads you used in the pktgen test before

Common parameters
-----------------
The parameters.sh file support easy and consistant parameter parsing
across the sample scripts.  Usage example is printed on errors::

 Usage: ./pktgen_sample01_simple.sh [-vx] -i ethX
  -i : ($DEV)       output interface/device (required)
  -s : ($PKT_SIZE)  packet size
  -d : ($DEST_IP)   destination IP
  -m : ($DST_MAC)   destination MAC-addr
  -t : ($THREADS)   threads to start
  -c : ($SKB_CLONE) SKB clones send before alloc new SKB
  -b : ($BURST)     HW level bursting of SKBs
  -v : ($VERBOSE)   verbose
  -x : ($DEBUG)     debug

The global variable being set is also listed.  E.g. the required
interface/device parameter "-i" sets variable $DEV.

Common functions
----------------
The functions.sh file provides; Three different shell functions for
configuring the different components of pktgen: pg_ctrl(), pg_thread()
and pg_set().

These functions correspond to pktgens different components.
 * pg_ctrl()   control "pgctrl" (/proc/net/pktgen/pgctrl)
 * pg_thread() control the kernel threads and binding to devices
 * pg_set()    control setup of individual devices

See sample scripts for usage examples.

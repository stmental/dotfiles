 /*  Author: David Foster      Date Created: June 14, 2000
   *  Last Modified: February 26, 2001
   *  DESCRIPTION: Simple TCP port scanner.  Provide the program
   * with a host and optional highest port number and it will
   * report which ports TCP connections can be made on.
   *  TO DO:  set l_linger and l_onoff with setsockopt so that
   * we don't leave TIME WAIT states for all active connections
  */

  #include <stdio.h>
  #include <stdlib.h>  //for atoi
  #include <errno.h>
  #include <sys/socket.h>
  #include <sys/types.h>
  #include <netinet/in.h>
  #include <netdb.h>
  #include <arpa/inet.h>  // inet_pton, inet_ntop, inet_aton, inet_addr, inet_ntoa

  #ifndef INET_ADDRSTRLEN
  #define INET_ADDRSTRLEN 16
  #endif

  int main(int argc, char **argv){
      int sockfd, i, iport=5950, err;
      char *s, str_addr[INET_ADDRSTRLEN];
      struct sockaddr_in  servaddr;
      struct servent *sserv;
      struct hostent *shost;

     bzero(&servaddr, sizeof(servaddr));
     servaddr.sin_family = AF_INET;
     if(argc == 1){
       printf("Usage: port <address or host> [highest port]\n");
       exit(0);
     }

     // Convert the host argument to the proper format
     if(inet_pton(AF_INET, argv[1], &servaddr.sin_addr) <= 0){
         printf("Attempting to resolve hostname %s....\n", argv[1]);
         if((shost = gethostbyname(argv[1])) == NULL){
        perror("Could not resolve hostname");
        exit(0);
         }else{
           memcpy(&servaddr.sin_addr, shost->h_addr, sizeof(struct in_addr));
         }
     }
     inet_ntop(AF_INET, &servaddr.sin_addr, str_addr, INET_ADDRSTRLEN);
     if(argv[2] ) iport = atoi(argv[2]);
     printf("Address: %s  Highest Port: %d\n", str_addr, iport);

  // servaddr.sin_port = htons(1);

  ////////////////////////////////////////
  // Check all ports from 1 to high limit
  ////////////////////////////////////////
     for(i=5900; i<=iport; i++){
        servaddr.sin_port = htons(i);
        if((sockfd = socket(AF_INET, SOCK_STREAM, 0)) < 0){
        perror("error creating socket");
        exit(0);
        }
        sserv = getservbyport(htons(i), "tcp");

  ////////////////////////////////////////
  // Try to connect to the current port
  ////////////////////////////////////////
        if(connect(sockfd, (struct sockaddr*) &servaddr, sizeof(servaddr)) >= 0){
        write(sockfd, "quit", 4);
        shutdown(sockfd, 2);
  //Does this port have a service name?  If so, let's find it and print it
        if(sserv == NULL){
           printf("%4d [               ] - ACTIVE\n", i);
        }else{
           printf("%4d [%-15s] - ACTIVE\n", i, sserv->s_name);
        }
        }else{  //Connection refused
        if((err = errno) == 113){  // No route to host errno
           perror("Connect error"); exit(0);
        }
        s = (char *) strerror(err);
  // We don't need to print "connection refused" socket info
  //    if(sserv == NULL){
  //       printf("%4d [               ] - %s\n", i, s);
  //    }else{
  //       printf("%4d [%-15s] - %s\n", i, sserv->s_name, s);
  //    }
        }
        close(sockfd);
     }//end for loop
     return(1);
  }


#include "types.h"
#include "user.h"

int PScheduler(void);
int test_donation(void);

int main(int argc, char *argv[])
{
    if (atoi(argv[1]) == 1)
      PScheduler();
    else if (atoi(argv[1]) == 2)
      test_donation();
    exit(0);
}


int test_donation(void){
 
    int pid, exit_status;
    int d= 13;
    
    printf(1, " - default priority is %d\n", getpriority());
    setpriority(getpid(), 22);
    pid = fork();
    if(pid == 0){
      for(int j = 0;j < 50000; j++){
        for(int k = 0; k < 10000; k++){
         asm("nop"); 
        }
      }
    printf(1, " \n donating %d \n ",  d);
    donate(getpid(), d);
    printf(1, " - child #%d exit with priority %d\n", getpid(), getpriority());
    exit(0);
    }
    if(pid > 0){
      setpriority(getpid(), 0);
      printf(1, "- this is parent #%d with priority%d\n", getpid(), getpriority());
      waitpid(pid, &exit_status, 0);
    }
    return 0;
}


 

int DScheduler(int value){
  int parent, pid, exit_status, i, j;

  printf(1, " \n Testing priority donation \n ");
  setpriority(getpid(), 20);
  parent = getpid();
  printf(1, " \n This is process %d with priority %d \n ", getpid(), getpriority() );
  pid = fork();

  if(pid > 0){
    wait(&exit_status);
    printf(1, " \n process %d now has priority %d after donation \n ", getpid(), getpriority() );
  }


  else if(pid == 0)
  {
    setpriority(getpid(), 10);
    printf(1, " \n This is process %d with priority %d \n ", getpid(), getpriority() );
    for(i = 0; i < 50000; i++){
      for(j = 0; j < 10000; j++){
        asm("nop");
      }
    }
    printf(1, " \n process %d is now donating %d priority to process %d \n ", getpid(), d, getpid());
    donate(parent, value);
    for(i = 0; i < 50000; i++){
      for(j = 0; j < 10000; j++){
        asm("nop");
      }
    }
    printf(1, " \n process %d now has priority %d after donation \n ", getpid(), getpriority() );
    exit(0);
  }


  return 0;
}


int PScheduler(void){
		 
    // Use this part to test the priority scheduler. Assuming that the priorities range between 0 to 31
    // 0 is the highest priority. All processes have a default priority of 10
    // You can use your own priority range/value setup

    int pid, ret_pid, exit_status;
    int i,j,k;
  
    printf(1, "Testing the priority scheduler and setpriority system call:\n");
    printf(1, "Assuming that the priorities range between 0 to 255\n");
    printf(1, "0 is the highest priority. All processes have a default priority of 128\n");
    printf(1, " - The parent processes will switch to priority 0\n");
    setpriority(0); // Use your own setpriority interface
    for (i = 0; i < 3; i++) {
        pid = fork();
        if (pid > 0) {
            continue;
        } else if ( pid == 0) {
            printf(1, " - Hello! this is child# %d and I will change my priority to %d \n", getpid(), 240-60*i);
            setpriority(240-60*i); // Use your own setpriority interface
            for (j = 0; j < 50000; j++) {
                for(k = 0; k < 10000; k++) {
                    asm("nop"); 
                }
            }
            printf(1, " - Child #%d with priority %d has finished! \n", getpid(), 240-60*i);	
            printf(1, " - The process with pid %d has a priority of %d after aging.\n", getpid(), getpriority(getpid()));
            exit(0);
        } else {
            printf(2," \n Error fork() \n");
            exit(-1);
        }
    }

    if(pid > 0) {
        for (i = 0; i < 3; i++) {
            printf(1, " - The process with pid %d has a priority of %d right now.\n", 3, getpriority(3));
            printf(1, " - The process with pid %d has a priority of %d right now.\n", 4, getpriority(4));
            printf(1, " - The process with pid %d has a priority of %d right now.\n", 5, getpriority(5));
            ret_pid = wait(&exit_status);
            printf(1, " - This is the parent: child with PID# %d has finished with status %d \n", ret_pid, exit_status); 
        }
        printf(1, " - If processes with highest priority finished first then its correct. \n");
    }
			
    return 0;
}



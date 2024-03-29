#include "types.h"
#include "x86.h"
#include "defs.h"
#include "date.h"
#include "param.h"
#include "memlayout.h"
#include "mmu.h"
#include "proc.h"
 
int
sys_fork(void)
{
  return fork();
}
/*
int
sys_exit(void)
{
  exit(0);
  return 0;  // not reached
}
*/

int
sys_exit(void)
{
	int status;
	if(0 > argint(0, &status)){
		return -1;
	}	
  	exit(status);	
  	return 0;  // not reached
}

//part 2
/*int
sys_wait(void)
{
	int* status;
	if(argptr(0, (void*)&status, sizeof(status)) < 0){
		return -1;
	}
	return wait(status);
}

//part 3
int
sys_waitpid(void)
{
	int* status;
	int options;
	int pid;
	
	if (argint(0, &pid) < 0) 
	{
		return -1;
	}
	if (argint(2, &options) < 0) 
	{
		return -1;
	}
	if ( argptr(1, (void*)&status, sizeof(status)) < 0) 
	{
		return -1;
	}
	return waitpid(pid, status, options);
}

int
sys_wait(void)
{
  int *p;
  argptr(0, (char**)&p, sizeof(int*));
  return wait(p);
}
*/

int
sys_wait(void)
{
	int* status;
	if(argptr(0, (void*)&status, sizeof(status)) < 0){
		return -1;
	}
	return wait(status);
}

int
sys_waitpid(void)
{
  int pid;
  int *status;
  int p;
  argint(0, &pid);
  argptr(1, (char**) &status, sizeof(int*));
  argint(2, &p);
  return waitpid(pid, status, p);
}
int
sys_kill(void)
{
  int pid;

  if(argint(0, &pid) < 0)
    return -1;
  return kill(pid);
}

int
sys_getpid(void)
{
  return myproc()->pid;
}

int
sys_sbrk(void)
{
  int addr;
  int n;

  if(argint(0, &n) < 0)
    return -1;
  addr = myproc()->sz;
  if(growproc(n) < 0)
    return -1;
  return addr;
}

int
sys_sleep(void)
{
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
    return -1;
  acquire(&tickslock);
  ticks0 = ticks;
  while(ticks - ticks0 < n){
    if(myproc()->killed){
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
  }
  release(&tickslock);
  return 0;
}

// return how many clock tick interrupts have occurred
// since start.
int
sys_uptime(void)
{
  uint xticks;

  acquire(&tickslock);
  xticks = ticks;
  release(&tickslock);
  return xticks;
}

//lab2 
int
sys_setpriority(void)
{
  int pid;
  int priority;
  argint(0, &pid);
  argint(1, &priority);
  setpriority(pid, priority);
  return 0;
}

int
sys_getpriority(void)
{
  return getpriority();
}

int
sys_donate(void)
{
  int pid;
  int donation;
  argint(0, &pid);
  argint(1, &donation);
  donate(pid, donation);
  return 0;
}
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

int
sys_exit(void)
{
  exit();
  return 0;  // not reached
}

int
sys_wait(void)
{
  return wait();
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

int
sys_shutdown(void) 
{
  outw(0xB004, 0x0|0x2000);
  outw(0x604, 0x0|0x2000);
 }

int
sys_shutdown2(void) 
{
  
  char *input;
  if (argstr(0, &input) < 0) {
    if (argstr(1, &input) < 0) {
      return -1;
    }
  }
  cprintf("%s \n", input);
  outw(0xB004, 0x0|0x2000);
  outw(0x604, 0x0|0x2000);
  return 0;
 }
 
int
sys_exit2(void)
{
  int status_argument = 0;
  argint(0, &status_argument);
  cprintf("Exit with status argument: %d\n", status_argument);
  exit();
  return 0;  // not reached
}
 
 int
sys_uptime2(void)
{
  uint xticks;
  int input;
  if(argint(0, &input) < 0) {
    return -1;
  }

  acquire(&tickslock);
  xticks = ticks;
  release(&tickslock);
  
  
  if(input == 1){
    return xticks;
  } 
  
  else if(input == 2){
    return xticks / 100;
  } 
  
  else if(input == 3){
    return xticks / 100 / 60;
  }
  
  return 0; 
}

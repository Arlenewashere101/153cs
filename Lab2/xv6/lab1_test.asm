
_lab1_test:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "user.h"

int exitWait(void);
int waitPid(void);

int main(int argc, char *argv[]) {
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	53                   	push   %ebx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	83 ec 10             	sub    $0x10,%esp
   a:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    printf(1, "####################################################\n");
   d:	c7 44 24 04 28 0d 00 	movl   $0xd28,0x4(%esp)
  14:	00 
  15:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  1c:	e8 af 07 00 00       	call   7d0 <printf>
    printf(1, "# This program tests the correctness of your lab#1\n");
  21:	c7 44 24 04 60 0d 00 	movl   $0xd60,0x4(%esp)
  28:	00 
  29:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  30:	e8 9b 07 00 00       	call   7d0 <printf>
    printf(1, "####################################################\n");
  35:	c7 44 24 04 28 0d 00 	movl   $0xd28,0x4(%esp)
  3c:	00 
  3d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  44:	e8 87 07 00 00       	call   7d0 <printf>
  
    if (atoi(argv[1]) == 1)
  49:	8b 43 04             	mov    0x4(%ebx),%eax
  4c:	89 04 24             	mov    %eax,(%esp)
  4f:	e8 cc 05 00 00       	call   620 <atoi>
  54:	83 f8 01             	cmp    $0x1,%eax
  57:	74 30                	je     89 <main+0x89>
        exitWait(); // Test exit and wait
    else if (atoi(argv[1]) == 2)
  59:	8b 43 04             	mov    0x4(%ebx),%eax
  5c:	89 04 24             	mov    %eax,(%esp)
  5f:	e8 bc 05 00 00       	call   620 <atoi>
  64:	83 f8 02             	cmp    $0x2,%eax
  67:	74 27                	je     90 <main+0x90>
        waitPid(); // Test waitpid
    else 
        printf(1, "\ntype \"lab1 1\" to test exit and wait, \"lab1 2\" to test waitpid \n");
  69:	c7 44 24 04 94 0d 00 	movl   $0xd94,0x4(%esp)
  70:	00 
  71:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  78:	e8 53 07 00 00       	call   7d0 <printf>
  
    // End of test
    exit(0);
  7d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  84:	e8 f9 05 00 00       	call   682 <exit>
        exitWait(); // Test exit and wait
  89:	e8 12 00 00 00       	call   a0 <exitWait>
  8e:	eb ed                	jmp    7d <main+0x7d>
        waitPid(); // Test waitpid
  90:	e8 0b 01 00 00       	call   1a0 <waitPid>
  95:	eb e6                	jmp    7d <main+0x7d>
  97:	66 90                	xchg   %ax,%ax
  99:	66 90                	xchg   %ax,%ax
  9b:	66 90                	xchg   %ax,%ax
  9d:	66 90                	xchg   %ax,%ax
  9f:	90                   	nop

000000a0 <exitWait>:
}
  
  
int exitWait(void) {
  a0:	55                   	push   %ebp
  a1:	89 e5                	mov    %esp,%ebp
  a3:	56                   	push   %esi
  a4:	53                   	push   %ebx
    int i;
   
    // use this part to test exit(int status) and wait(int* status)
    printf(1, "Step 1: testing exit(int status) and wait(int* status):\n");

    for (i = 0; i < 2; i++) {
  a5:	31 db                	xor    %ebx,%ebx
int exitWait(void) {
  a7:	83 ec 20             	sub    $0x20,%esp
    printf(1, "Step 1: testing exit(int status) and wait(int* status):\n");
  aa:	c7 44 24 04 38 0b 00 	movl   $0xb38,0x4(%esp)
  b1:	00 
            } else {
                printf(1, " - This is child with PID# %d and I will exit with status %d\n" ,getpid(), -1);
                exit(-1);
            } 
        } else if (pid > 0) { // only the parent executes this code
            ret_pid = wait(&exit_status);
  b2:	8d 75 f4             	lea    -0xc(%ebp),%esi
    printf(1, "Step 1: testing exit(int status) and wait(int* status):\n");
  b5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  bc:	e8 0f 07 00 00       	call   7d0 <printf>
        pid = fork();
  c1:	e8 b4 05 00 00       	call   67a <fork>
        if (pid == 0) { // only the child executed this code
  c6:	83 f8 00             	cmp    $0x0,%eax
  c9:	74 45                	je     110 <exitWait+0x70>
  cb:	90                   	nop
  cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        } else if (pid > 0) { // only the parent executes this code
  d0:	0f 8e a3 00 00 00    	jle    179 <exitWait+0xd9>
            ret_pid = wait(&exit_status);
  d6:	89 34 24             	mov    %esi,(%esp)
    for (i = 0; i < 2; i++) {
  d9:	83 c3 01             	add    $0x1,%ebx
            ret_pid = wait(&exit_status);
  dc:	e8 a9 05 00 00       	call   68a <wait>
            printf(1, " - This is the parent: child with PID# %d has exited with status %d\n", ret_pid, exit_status);
  e1:	8b 55 f4             	mov    -0xc(%ebp),%edx
  e4:	c7 44 24 04 b4 0b 00 	movl   $0xbb4,0x4(%esp)
  eb:	00 
  ec:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  f3:	89 54 24 0c          	mov    %edx,0xc(%esp)
  f7:	89 44 24 08          	mov    %eax,0x8(%esp)
  fb:	e8 d0 06 00 00       	call   7d0 <printf>
    for (i = 0; i < 2; i++) {
 100:	83 fb 02             	cmp    $0x2,%ebx
 103:	75 bc                	jne    c1 <exitWait+0x21>
            printf(2, " - Error using fork\n");
            exit(-1);
        }
    }
    return 0;
}
 105:	83 c4 20             	add    $0x20,%esp
 108:	31 c0                	xor    %eax,%eax
 10a:	5b                   	pop    %ebx
 10b:	5e                   	pop    %esi
 10c:	5d                   	pop    %ebp
 10d:	c3                   	ret    
 10e:	66 90                	xchg   %ax,%ax
            if (i == 0) {
 110:	85 db                	test   %ebx,%ebx
 112:	75 34                	jne    148 <exitWait+0xa8>
                printf(1, " - This is child with PID# %d and I will exit with status %d\n", getpid(), 65537);
 114:	e8 f1 05 00 00       	call   70a <getpid>
 119:	c7 44 24 0c 01 00 01 	movl   $0x10001,0xc(%esp)
 120:	00 
 121:	c7 44 24 04 74 0b 00 	movl   $0xb74,0x4(%esp)
 128:	00 
 129:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 130:	89 44 24 08          	mov    %eax,0x8(%esp)
 134:	e8 97 06 00 00       	call   7d0 <printf>
                exit(65537);
 139:	c7 04 24 01 00 01 00 	movl   $0x10001,(%esp)
 140:	e8 3d 05 00 00       	call   682 <exit>
 145:	8d 76 00             	lea    0x0(%esi),%esi
                printf(1, " - This is child with PID# %d and I will exit with status %d\n" ,getpid(), -1);
 148:	e8 bd 05 00 00       	call   70a <getpid>
 14d:	c7 44 24 0c ff ff ff 	movl   $0xffffffff,0xc(%esp)
 154:	ff 
 155:	c7 44 24 04 74 0b 00 	movl   $0xb74,0x4(%esp)
 15c:	00 
 15d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 164:	89 44 24 08          	mov    %eax,0x8(%esp)
 168:	e8 63 06 00 00       	call   7d0 <printf>
                exit(-1);
 16d:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
 174:	e8 09 05 00 00       	call   682 <exit>
            printf(2, " - Error using fork\n");
 179:	c7 44 24 04 d8 0d 00 	movl   $0xdd8,0x4(%esp)
 180:	00 
 181:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 188:	e8 43 06 00 00       	call   7d0 <printf>
            exit(-1);
 18d:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
 194:	e8 e9 04 00 00       	call   682 <exit>
 199:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000001a0 <waitPid>:

int waitPid(void){	
 1a0:	55                   	push   %ebp
 1a1:	89 e5                	mov    %esp,%ebp
 1a3:	57                   	push   %edi
 1a4:	56                   	push   %esi
 1a5:	53                   	push   %ebx
 1a6:	83 ec 3c             	sub    $0x3c,%esp
    int ret_pid, exit_status;
    int i;
    int pid_a[5]={0, 0, 0, 0, 0};
 1a9:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 1b0:	8d 5d d4             	lea    -0x2c(%ebp),%ebx
 1b3:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
 1ba:	8d 75 e8             	lea    -0x18(%ebp),%esi
 1bd:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
 1c4:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
 1cb:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    // use this part to test wait(int pid, int* status, int options)
    int mypid;
    mypid = getpid();
 1d2:	e8 33 05 00 00       	call   70a <getpid>
    printf(1, "Step 2: testing waitpid(int pid, int* status, int options):\n");
 1d7:	c7 44 24 04 fc 0b 00 	movl   $0xbfc,0x4(%esp)
 1de:	00 
 1df:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    mypid = getpid();
 1e6:	89 c7                	mov    %eax,%edi
    printf(1, "Step 2: testing waitpid(int pid, int* status, int options):\n");
 1e8:	e8 e3 05 00 00       	call   7d0 <printf>

    for (i = 0; i <5; i++) {
        pid_a[i] = fork();
 1ed:	e8 88 04 00 00       	call   67a <fork>
	
        if (pid_a[i] == 0) { // only the child executed this code  
 1f2:	85 c0                	test   %eax,%eax
        pid_a[i] = fork();
 1f4:	89 03                	mov    %eax,(%ebx)
        if (pid_a[i] == 0) { // only the child executed this code  
 1f6:	0f 84 2d 02 00 00    	je     429 <waitPid+0x289>
 1fc:	83 c3 04             	add    $0x4,%ebx
    for (i = 0; i <5; i++) {
 1ff:	39 f3                	cmp    %esi,%ebx
 201:	75 ea                	jne    1ed <waitPid+0x4d>
            printf(1, " - The is child with PID# %d and I will exit with status %d\n", getpid(), 0);
            exit(0);
        }
    }
       
    sleep(5);
 203:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
    
    printf(1, " - This is the parent: Now waiting for child with PID# %d\n",pid_a[3]);
    ret_pid = waitpid(pid_a[3], &exit_status, 0);
 20a:	8d 5d d0             	lea    -0x30(%ebp),%ebx
    sleep(5);
 20d:	e8 08 05 00 00       	call   71a <sleep>
    printf(1, " - This is the parent: Now waiting for child with PID# %d\n",pid_a[3]);
 212:	8b 75 e0             	mov    -0x20(%ebp),%esi
 215:	c7 44 24 04 7c 0c 00 	movl   $0xc7c,0x4(%esp)
 21c:	00 
 21d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 224:	89 74 24 08          	mov    %esi,0x8(%esp)
 228:	e8 a3 05 00 00       	call   7d0 <printf>
    ret_pid = waitpid(pid_a[3], &exit_status, 0);
 22d:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 231:	89 34 24             	mov    %esi,(%esp)
 234:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
 23b:	00 
 23c:	e8 51 04 00 00       	call   692 <waitpid>
    printf(1, " - This is the parent: Child# %d has exited with status %d\n",ret_pid, exit_status);
 241:	8b 55 d0             	mov    -0x30(%ebp),%edx
 244:	c7 44 24 04 b8 0c 00 	movl   $0xcb8,0x4(%esp)
 24b:	00 
 24c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 253:	89 54 24 0c          	mov    %edx,0xc(%esp)
 257:	89 44 24 08          	mov    %eax,0x8(%esp)
 25b:	e8 70 05 00 00       	call   7d0 <printf>
    sleep(5);
 260:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
 267:	e8 ae 04 00 00       	call   71a <sleep>
    printf(1, " - This is the parent: Now waiting for child with PID# %d\n",pid_a[1]);
 26c:	8b 75 d8             	mov    -0x28(%ebp),%esi
 26f:	c7 44 24 04 7c 0c 00 	movl   $0xc7c,0x4(%esp)
 276:	00 
 277:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 27e:	89 74 24 08          	mov    %esi,0x8(%esp)
 282:	e8 49 05 00 00       	call   7d0 <printf>
    ret_pid = waitpid(pid_a[1], &exit_status, 0);
 287:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 28b:	89 34 24             	mov    %esi,(%esp)
 28e:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
 295:	00 
 296:	e8 f7 03 00 00       	call   692 <waitpid>
    printf(1, " - This is the parent: Child# %d has exited with status %d\n",ret_pid, exit_status);
 29b:	8b 55 d0             	mov    -0x30(%ebp),%edx
 29e:	c7 44 24 04 b8 0c 00 	movl   $0xcb8,0x4(%esp)
 2a5:	00 
 2a6:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 2ad:	89 54 24 0c          	mov    %edx,0xc(%esp)
 2b1:	89 44 24 08          	mov    %eax,0x8(%esp)
 2b5:	e8 16 05 00 00       	call   7d0 <printf>
    sleep(5);
 2ba:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
 2c1:	e8 54 04 00 00       	call   71a <sleep>
    printf(1, " - This is the parent: Now waiting for child with PID# %d\n",pid_a[2]);
 2c6:	8b 75 dc             	mov    -0x24(%ebp),%esi
 2c9:	c7 44 24 04 7c 0c 00 	movl   $0xc7c,0x4(%esp)
 2d0:	00 
 2d1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 2d8:	89 74 24 08          	mov    %esi,0x8(%esp)
 2dc:	e8 ef 04 00 00       	call   7d0 <printf>
    ret_pid = waitpid(pid_a[2], &exit_status, 0);
 2e1:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 2e5:	89 34 24             	mov    %esi,(%esp)
 2e8:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
 2ef:	00 
 2f0:	e8 9d 03 00 00       	call   692 <waitpid>
    printf(1, " - This is the parent: Child# %d has exited with status %d\n",ret_pid, exit_status);
 2f5:	8b 55 d0             	mov    -0x30(%ebp),%edx
 2f8:	c7 44 24 04 b8 0c 00 	movl   $0xcb8,0x4(%esp)
 2ff:	00 
 300:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 307:	89 54 24 0c          	mov    %edx,0xc(%esp)
 30b:	89 44 24 08          	mov    %eax,0x8(%esp)
 30f:	e8 bc 04 00 00       	call   7d0 <printf>
    sleep(5);
 314:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
 31b:	e8 fa 03 00 00       	call   71a <sleep>
    printf(1, " - This is the parent: Now waiting for child with PID# %d\n",pid_a[0]);
 320:	8b 75 d4             	mov    -0x2c(%ebp),%esi
 323:	c7 44 24 04 7c 0c 00 	movl   $0xc7c,0x4(%esp)
 32a:	00 
 32b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 332:	89 74 24 08          	mov    %esi,0x8(%esp)
 336:	e8 95 04 00 00       	call   7d0 <printf>
    ret_pid = waitpid(pid_a[0], &exit_status, 0);
 33b:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 33f:	89 34 24             	mov    %esi,(%esp)
 342:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
 349:	00 
 34a:	e8 43 03 00 00       	call   692 <waitpid>
    printf(1, " - This is the parent: Child# %d has exited with status %d\n",ret_pid, exit_status);
 34f:	8b 55 d0             	mov    -0x30(%ebp),%edx
 352:	c7 44 24 04 b8 0c 00 	movl   $0xcb8,0x4(%esp)
 359:	00 
 35a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 361:	89 54 24 0c          	mov    %edx,0xc(%esp)
 365:	89 44 24 08          	mov    %eax,0x8(%esp)
 369:	e8 62 04 00 00       	call   7d0 <printf>
    sleep(5);
 36e:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
 375:	e8 a0 03 00 00       	call   71a <sleep>
    printf(1, " - This is the parent: Now waiting for child with PID# %d\n",pid_a[4]);
 37a:	8b 75 e4             	mov    -0x1c(%ebp),%esi
 37d:	c7 44 24 04 7c 0c 00 	movl   $0xc7c,0x4(%esp)
 384:	00 
 385:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 38c:	89 74 24 08          	mov    %esi,0x8(%esp)
 390:	e8 3b 04 00 00       	call   7d0 <printf>
    ret_pid = waitpid(pid_a[4], &exit_status, 0);
 395:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 399:	89 34 24             	mov    %esi,(%esp)
 39c:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
 3a3:	00 
 3a4:	e8 e9 02 00 00       	call   692 <waitpid>
    printf(1, " - This is the parent: Child# %d has exited with status %d\n",ret_pid, exit_status);
 3a9:	8b 55 d0             	mov    -0x30(%ebp),%edx
 3ac:	c7 44 24 04 b8 0c 00 	movl   $0xcb8,0x4(%esp)
 3b3:	00 
 3b4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 3bb:	89 54 24 0c          	mov    %edx,0xc(%esp)
 3bf:	89 44 24 08          	mov    %eax,0x8(%esp)
 3c3:	e8 08 04 00 00       	call   7d0 <printf>
    sleep(5);
 3c8:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
 3cf:	e8 46 03 00 00       	call   71a <sleep>
    printf(1, " - This is the parent: Now waiting for itself %d\n",mypid);
 3d4:	89 7c 24 08          	mov    %edi,0x8(%esp)
 3d8:	c7 44 24 04 f4 0c 00 	movl   $0xcf4,0x4(%esp)
 3df:	00 
 3e0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 3e7:	e8 e4 03 00 00       	call   7d0 <printf>
    ret_pid = waitpid(mypid, &exit_status, 0);
 3ec:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 3f0:	89 3c 24             	mov    %edi,(%esp)
 3f3:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
 3fa:	00 
 3fb:	e8 92 02 00 00       	call   692 <waitpid>
    printf(1, " - This is the parent: Child# %d has exited with status %d\n",ret_pid, exit_status);
 400:	8b 55 d0             	mov    -0x30(%ebp),%edx
 403:	c7 44 24 04 b8 0c 00 	movl   $0xcb8,0x4(%esp)
 40a:	00 
 40b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 412:	89 54 24 0c          	mov    %edx,0xc(%esp)
 416:	89 44 24 08          	mov    %eax,0x8(%esp)
 41a:	e8 b1 03 00 00       	call   7d0 <printf>
    
    return 0;
}
 41f:	83 c4 3c             	add    $0x3c,%esp
 422:	31 c0                	xor    %eax,%eax
 424:	5b                   	pop    %ebx
 425:	5e                   	pop    %esi
 426:	5f                   	pop    %edi
 427:	5d                   	pop    %ebp
 428:	c3                   	ret    
            printf(1, " - The is child with PID# %d and I will exit with status %d\n", getpid(), 0);
 429:	e8 dc 02 00 00       	call   70a <getpid>
 42e:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 435:	00 
 436:	c7 44 24 04 3c 0c 00 	movl   $0xc3c,0x4(%esp)
 43d:	00 
 43e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 445:	89 44 24 08          	mov    %eax,0x8(%esp)
 449:	e8 82 03 00 00       	call   7d0 <printf>
            exit(0);
 44e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 455:	e8 28 02 00 00       	call   682 <exit>
 45a:	66 90                	xchg   %ax,%ax
 45c:	66 90                	xchg   %ax,%ax
 45e:	66 90                	xchg   %ax,%ax

00000460 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 460:	55                   	push   %ebp
 461:	89 e5                	mov    %esp,%ebp
 463:	8b 45 08             	mov    0x8(%ebp),%eax
 466:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 469:	53                   	push   %ebx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 46a:	89 c2                	mov    %eax,%edx
 46c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 470:	83 c1 01             	add    $0x1,%ecx
 473:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 477:	83 c2 01             	add    $0x1,%edx
 47a:	84 db                	test   %bl,%bl
 47c:	88 5a ff             	mov    %bl,-0x1(%edx)
 47f:	75 ef                	jne    470 <strcpy+0x10>
    ;
  return os;
}
 481:	5b                   	pop    %ebx
 482:	5d                   	pop    %ebp
 483:	c3                   	ret    
 484:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 48a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000490 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 490:	55                   	push   %ebp
 491:	89 e5                	mov    %esp,%ebp
 493:	8b 55 08             	mov    0x8(%ebp),%edx
 496:	53                   	push   %ebx
 497:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 49a:	0f b6 02             	movzbl (%edx),%eax
 49d:	84 c0                	test   %al,%al
 49f:	74 2d                	je     4ce <strcmp+0x3e>
 4a1:	0f b6 19             	movzbl (%ecx),%ebx
 4a4:	38 d8                	cmp    %bl,%al
 4a6:	74 0e                	je     4b6 <strcmp+0x26>
 4a8:	eb 2b                	jmp    4d5 <strcmp+0x45>
 4aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 4b0:	38 c8                	cmp    %cl,%al
 4b2:	75 15                	jne    4c9 <strcmp+0x39>
    p++, q++;
 4b4:	89 d9                	mov    %ebx,%ecx
 4b6:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 4b9:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 4bc:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 4bf:	0f b6 49 01          	movzbl 0x1(%ecx),%ecx
 4c3:	84 c0                	test   %al,%al
 4c5:	75 e9                	jne    4b0 <strcmp+0x20>
 4c7:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 4c9:	29 c8                	sub    %ecx,%eax
}
 4cb:	5b                   	pop    %ebx
 4cc:	5d                   	pop    %ebp
 4cd:	c3                   	ret    
 4ce:	0f b6 09             	movzbl (%ecx),%ecx
  while(*p && *p == *q)
 4d1:	31 c0                	xor    %eax,%eax
 4d3:	eb f4                	jmp    4c9 <strcmp+0x39>
 4d5:	0f b6 cb             	movzbl %bl,%ecx
 4d8:	eb ef                	jmp    4c9 <strcmp+0x39>
 4da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000004e0 <strlen>:

uint
strlen(const char *s)
{
 4e0:	55                   	push   %ebp
 4e1:	89 e5                	mov    %esp,%ebp
 4e3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 4e6:	80 39 00             	cmpb   $0x0,(%ecx)
 4e9:	74 12                	je     4fd <strlen+0x1d>
 4eb:	31 d2                	xor    %edx,%edx
 4ed:	8d 76 00             	lea    0x0(%esi),%esi
 4f0:	83 c2 01             	add    $0x1,%edx
 4f3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 4f7:	89 d0                	mov    %edx,%eax
 4f9:	75 f5                	jne    4f0 <strlen+0x10>
    ;
  return n;
}
 4fb:	5d                   	pop    %ebp
 4fc:	c3                   	ret    
  for(n = 0; s[n]; n++)
 4fd:	31 c0                	xor    %eax,%eax
}
 4ff:	5d                   	pop    %ebp
 500:	c3                   	ret    
 501:	eb 0d                	jmp    510 <memset>
 503:	90                   	nop
 504:	90                   	nop
 505:	90                   	nop
 506:	90                   	nop
 507:	90                   	nop
 508:	90                   	nop
 509:	90                   	nop
 50a:	90                   	nop
 50b:	90                   	nop
 50c:	90                   	nop
 50d:	90                   	nop
 50e:	90                   	nop
 50f:	90                   	nop

00000510 <memset>:

void*
memset(void *dst, int c, uint n)
{
 510:	55                   	push   %ebp
 511:	89 e5                	mov    %esp,%ebp
 513:	8b 55 08             	mov    0x8(%ebp),%edx
 516:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 517:	8b 4d 10             	mov    0x10(%ebp),%ecx
 51a:	8b 45 0c             	mov    0xc(%ebp),%eax
 51d:	89 d7                	mov    %edx,%edi
 51f:	fc                   	cld    
 520:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 522:	89 d0                	mov    %edx,%eax
 524:	5f                   	pop    %edi
 525:	5d                   	pop    %ebp
 526:	c3                   	ret    
 527:	89 f6                	mov    %esi,%esi
 529:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000530 <strchr>:

char*
strchr(const char *s, char c)
{
 530:	55                   	push   %ebp
 531:	89 e5                	mov    %esp,%ebp
 533:	8b 45 08             	mov    0x8(%ebp),%eax
 536:	53                   	push   %ebx
 537:	8b 55 0c             	mov    0xc(%ebp),%edx
  for(; *s; s++)
 53a:	0f b6 18             	movzbl (%eax),%ebx
 53d:	84 db                	test   %bl,%bl
 53f:	74 1d                	je     55e <strchr+0x2e>
    if(*s == c)
 541:	38 d3                	cmp    %dl,%bl
 543:	89 d1                	mov    %edx,%ecx
 545:	75 0d                	jne    554 <strchr+0x24>
 547:	eb 17                	jmp    560 <strchr+0x30>
 549:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 550:	38 ca                	cmp    %cl,%dl
 552:	74 0c                	je     560 <strchr+0x30>
  for(; *s; s++)
 554:	83 c0 01             	add    $0x1,%eax
 557:	0f b6 10             	movzbl (%eax),%edx
 55a:	84 d2                	test   %dl,%dl
 55c:	75 f2                	jne    550 <strchr+0x20>
      return (char*)s;
  return 0;
 55e:	31 c0                	xor    %eax,%eax
}
 560:	5b                   	pop    %ebx
 561:	5d                   	pop    %ebp
 562:	c3                   	ret    
 563:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 569:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000570 <gets>:

char*
gets(char *buf, int max)
{
 570:	55                   	push   %ebp
 571:	89 e5                	mov    %esp,%ebp
 573:	57                   	push   %edi
 574:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 575:	31 f6                	xor    %esi,%esi
{
 577:	53                   	push   %ebx
 578:	83 ec 2c             	sub    $0x2c,%esp
    cc = read(0, &c, 1);
 57b:	8d 7d e7             	lea    -0x19(%ebp),%edi
  for(i=0; i+1 < max; ){
 57e:	eb 31                	jmp    5b1 <gets+0x41>
    cc = read(0, &c, 1);
 580:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 587:	00 
 588:	89 7c 24 04          	mov    %edi,0x4(%esp)
 58c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 593:	e8 0a 01 00 00       	call   6a2 <read>
    if(cc < 1)
 598:	85 c0                	test   %eax,%eax
 59a:	7e 1d                	jle    5b9 <gets+0x49>
      break;
    buf[i++] = c;
 59c:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
  for(i=0; i+1 < max; ){
 5a0:	89 de                	mov    %ebx,%esi
    buf[i++] = c;
 5a2:	8b 55 08             	mov    0x8(%ebp),%edx
    if(c == '\n' || c == '\r')
 5a5:	3c 0d                	cmp    $0xd,%al
    buf[i++] = c;
 5a7:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 5ab:	74 0c                	je     5b9 <gets+0x49>
 5ad:	3c 0a                	cmp    $0xa,%al
 5af:	74 08                	je     5b9 <gets+0x49>
  for(i=0; i+1 < max; ){
 5b1:	8d 5e 01             	lea    0x1(%esi),%ebx
 5b4:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 5b7:	7c c7                	jl     580 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 5b9:	8b 45 08             	mov    0x8(%ebp),%eax
 5bc:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 5c0:	83 c4 2c             	add    $0x2c,%esp
 5c3:	5b                   	pop    %ebx
 5c4:	5e                   	pop    %esi
 5c5:	5f                   	pop    %edi
 5c6:	5d                   	pop    %ebp
 5c7:	c3                   	ret    
 5c8:	90                   	nop
 5c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000005d0 <stat>:

int
stat(const char *n, struct stat *st)
{
 5d0:	55                   	push   %ebp
 5d1:	89 e5                	mov    %esp,%ebp
 5d3:	56                   	push   %esi
 5d4:	53                   	push   %ebx
 5d5:	83 ec 10             	sub    $0x10,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 5d8:	8b 45 08             	mov    0x8(%ebp),%eax
 5db:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 5e2:	00 
 5e3:	89 04 24             	mov    %eax,(%esp)
 5e6:	e8 df 00 00 00       	call   6ca <open>
  if(fd < 0)
 5eb:	85 c0                	test   %eax,%eax
  fd = open(n, O_RDONLY);
 5ed:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
 5ef:	78 27                	js     618 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 5f1:	8b 45 0c             	mov    0xc(%ebp),%eax
 5f4:	89 1c 24             	mov    %ebx,(%esp)
 5f7:	89 44 24 04          	mov    %eax,0x4(%esp)
 5fb:	e8 e2 00 00 00       	call   6e2 <fstat>
  close(fd);
 600:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 603:	89 c6                	mov    %eax,%esi
  close(fd);
 605:	e8 a8 00 00 00       	call   6b2 <close>
  return r;
 60a:	89 f0                	mov    %esi,%eax
}
 60c:	83 c4 10             	add    $0x10,%esp
 60f:	5b                   	pop    %ebx
 610:	5e                   	pop    %esi
 611:	5d                   	pop    %ebp
 612:	c3                   	ret    
 613:	90                   	nop
 614:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 618:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 61d:	eb ed                	jmp    60c <stat+0x3c>
 61f:	90                   	nop

00000620 <atoi>:

int
atoi(const char *s)
{
 620:	55                   	push   %ebp
 621:	89 e5                	mov    %esp,%ebp
 623:	8b 4d 08             	mov    0x8(%ebp),%ecx
 626:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 627:	0f be 11             	movsbl (%ecx),%edx
 62a:	8d 42 d0             	lea    -0x30(%edx),%eax
 62d:	3c 09                	cmp    $0x9,%al
  n = 0;
 62f:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 634:	77 17                	ja     64d <atoi+0x2d>
 636:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 638:	83 c1 01             	add    $0x1,%ecx
 63b:	8d 04 80             	lea    (%eax,%eax,4),%eax
 63e:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
 642:	0f be 11             	movsbl (%ecx),%edx
 645:	8d 5a d0             	lea    -0x30(%edx),%ebx
 648:	80 fb 09             	cmp    $0x9,%bl
 64b:	76 eb                	jbe    638 <atoi+0x18>
  return n;
}
 64d:	5b                   	pop    %ebx
 64e:	5d                   	pop    %ebp
 64f:	c3                   	ret    

00000650 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 650:	55                   	push   %ebp
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 651:	31 d2                	xor    %edx,%edx
{
 653:	89 e5                	mov    %esp,%ebp
 655:	56                   	push   %esi
 656:	8b 45 08             	mov    0x8(%ebp),%eax
 659:	53                   	push   %ebx
 65a:	8b 5d 10             	mov    0x10(%ebp),%ebx
 65d:	8b 75 0c             	mov    0xc(%ebp),%esi
  while(n-- > 0)
 660:	85 db                	test   %ebx,%ebx
 662:	7e 12                	jle    676 <memmove+0x26>
 664:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 668:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 66c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 66f:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
 672:	39 da                	cmp    %ebx,%edx
 674:	75 f2                	jne    668 <memmove+0x18>
  return vdst;
}
 676:	5b                   	pop    %ebx
 677:	5e                   	pop    %esi
 678:	5d                   	pop    %ebp
 679:	c3                   	ret    

0000067a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 67a:	b8 01 00 00 00       	mov    $0x1,%eax
 67f:	cd 40                	int    $0x40
 681:	c3                   	ret    

00000682 <exit>:
SYSCALL(exit)
 682:	b8 02 00 00 00       	mov    $0x2,%eax
 687:	cd 40                	int    $0x40
 689:	c3                   	ret    

0000068a <wait>:
SYSCALL(wait)
 68a:	b8 03 00 00 00       	mov    $0x3,%eax
 68f:	cd 40                	int    $0x40
 691:	c3                   	ret    

00000692 <waitpid>:
SYSCALL(waitpid)
 692:	b8 16 00 00 00       	mov    $0x16,%eax
 697:	cd 40                	int    $0x40
 699:	c3                   	ret    

0000069a <pipe>:
SYSCALL(pipe)
 69a:	b8 04 00 00 00       	mov    $0x4,%eax
 69f:	cd 40                	int    $0x40
 6a1:	c3                   	ret    

000006a2 <read>:
SYSCALL(read)
 6a2:	b8 05 00 00 00       	mov    $0x5,%eax
 6a7:	cd 40                	int    $0x40
 6a9:	c3                   	ret    

000006aa <write>:
SYSCALL(write)
 6aa:	b8 10 00 00 00       	mov    $0x10,%eax
 6af:	cd 40                	int    $0x40
 6b1:	c3                   	ret    

000006b2 <close>:
SYSCALL(close)
 6b2:	b8 15 00 00 00       	mov    $0x15,%eax
 6b7:	cd 40                	int    $0x40
 6b9:	c3                   	ret    

000006ba <kill>:
SYSCALL(kill)
 6ba:	b8 06 00 00 00       	mov    $0x6,%eax
 6bf:	cd 40                	int    $0x40
 6c1:	c3                   	ret    

000006c2 <exec>:
SYSCALL(exec)
 6c2:	b8 07 00 00 00       	mov    $0x7,%eax
 6c7:	cd 40                	int    $0x40
 6c9:	c3                   	ret    

000006ca <open>:
SYSCALL(open)
 6ca:	b8 0f 00 00 00       	mov    $0xf,%eax
 6cf:	cd 40                	int    $0x40
 6d1:	c3                   	ret    

000006d2 <mknod>:
SYSCALL(mknod)
 6d2:	b8 11 00 00 00       	mov    $0x11,%eax
 6d7:	cd 40                	int    $0x40
 6d9:	c3                   	ret    

000006da <unlink>:
SYSCALL(unlink)
 6da:	b8 12 00 00 00       	mov    $0x12,%eax
 6df:	cd 40                	int    $0x40
 6e1:	c3                   	ret    

000006e2 <fstat>:
SYSCALL(fstat)
 6e2:	b8 08 00 00 00       	mov    $0x8,%eax
 6e7:	cd 40                	int    $0x40
 6e9:	c3                   	ret    

000006ea <link>:
SYSCALL(link)
 6ea:	b8 13 00 00 00       	mov    $0x13,%eax
 6ef:	cd 40                	int    $0x40
 6f1:	c3                   	ret    

000006f2 <mkdir>:
SYSCALL(mkdir)
 6f2:	b8 14 00 00 00       	mov    $0x14,%eax
 6f7:	cd 40                	int    $0x40
 6f9:	c3                   	ret    

000006fa <chdir>:
SYSCALL(chdir)
 6fa:	b8 09 00 00 00       	mov    $0x9,%eax
 6ff:	cd 40                	int    $0x40
 701:	c3                   	ret    

00000702 <dup>:
SYSCALL(dup)
 702:	b8 0a 00 00 00       	mov    $0xa,%eax
 707:	cd 40                	int    $0x40
 709:	c3                   	ret    

0000070a <getpid>:
SYSCALL(getpid)
 70a:	b8 0b 00 00 00       	mov    $0xb,%eax
 70f:	cd 40                	int    $0x40
 711:	c3                   	ret    

00000712 <sbrk>:
SYSCALL(sbrk)
 712:	b8 0c 00 00 00       	mov    $0xc,%eax
 717:	cd 40                	int    $0x40
 719:	c3                   	ret    

0000071a <sleep>:
SYSCALL(sleep)
 71a:	b8 0d 00 00 00       	mov    $0xd,%eax
 71f:	cd 40                	int    $0x40
 721:	c3                   	ret    

00000722 <uptime>:
SYSCALL(uptime)
 722:	b8 0e 00 00 00       	mov    $0xe,%eax
 727:	cd 40                	int    $0x40
 729:	c3                   	ret    
 72a:	66 90                	xchg   %ax,%ax
 72c:	66 90                	xchg   %ax,%ax
 72e:	66 90                	xchg   %ax,%ax

00000730 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 730:	55                   	push   %ebp
 731:	89 e5                	mov    %esp,%ebp
 733:	57                   	push   %edi
 734:	56                   	push   %esi
 735:	89 c6                	mov    %eax,%esi
 737:	53                   	push   %ebx
 738:	83 ec 4c             	sub    $0x4c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 73b:	8b 5d 08             	mov    0x8(%ebp),%ebx
 73e:	85 db                	test   %ebx,%ebx
 740:	74 09                	je     74b <printint+0x1b>
 742:	89 d0                	mov    %edx,%eax
 744:	c1 e8 1f             	shr    $0x1f,%eax
 747:	84 c0                	test   %al,%al
 749:	75 75                	jne    7c0 <printint+0x90>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 74b:	89 d0                	mov    %edx,%eax
  neg = 0;
 74d:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 754:	89 75 c0             	mov    %esi,-0x40(%ebp)
  }

  i = 0;
 757:	31 ff                	xor    %edi,%edi
 759:	89 ce                	mov    %ecx,%esi
 75b:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 75e:	eb 02                	jmp    762 <printint+0x32>
  do{
    buf[i++] = digits[x % base];
 760:	89 cf                	mov    %ecx,%edi
 762:	31 d2                	xor    %edx,%edx
 764:	f7 f6                	div    %esi
 766:	8d 4f 01             	lea    0x1(%edi),%ecx
 769:	0f b6 92 f4 0d 00 00 	movzbl 0xdf4(%edx),%edx
  }while((x /= base) != 0);
 770:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
 772:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
 775:	75 e9                	jne    760 <printint+0x30>
  if(neg)
 777:	8b 55 c4             	mov    -0x3c(%ebp),%edx
    buf[i++] = digits[x % base];
 77a:	89 c8                	mov    %ecx,%eax
 77c:	8b 75 c0             	mov    -0x40(%ebp),%esi
  if(neg)
 77f:	85 d2                	test   %edx,%edx
 781:	74 08                	je     78b <printint+0x5b>
    buf[i++] = '-';
 783:	8d 4f 02             	lea    0x2(%edi),%ecx
 786:	c6 44 05 d8 2d       	movb   $0x2d,-0x28(%ebp,%eax,1)

  while(--i >= 0)
 78b:	8d 79 ff             	lea    -0x1(%ecx),%edi
 78e:	66 90                	xchg   %ax,%ax
 790:	0f b6 44 3d d8       	movzbl -0x28(%ebp,%edi,1),%eax
 795:	83 ef 01             	sub    $0x1,%edi
  write(fd, &c, 1);
 798:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 79f:	00 
 7a0:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 7a4:	89 34 24             	mov    %esi,(%esp)
 7a7:	88 45 d7             	mov    %al,-0x29(%ebp)
 7aa:	e8 fb fe ff ff       	call   6aa <write>
  while(--i >= 0)
 7af:	83 ff ff             	cmp    $0xffffffff,%edi
 7b2:	75 dc                	jne    790 <printint+0x60>
    putc(fd, buf[i]);
}
 7b4:	83 c4 4c             	add    $0x4c,%esp
 7b7:	5b                   	pop    %ebx
 7b8:	5e                   	pop    %esi
 7b9:	5f                   	pop    %edi
 7ba:	5d                   	pop    %ebp
 7bb:	c3                   	ret    
 7bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    x = -xx;
 7c0:	89 d0                	mov    %edx,%eax
 7c2:	f7 d8                	neg    %eax
    neg = 1;
 7c4:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
 7cb:	eb 87                	jmp    754 <printint+0x24>
 7cd:	8d 76 00             	lea    0x0(%esi),%esi

000007d0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 7d0:	55                   	push   %ebp
 7d1:	89 e5                	mov    %esp,%ebp
 7d3:	57                   	push   %edi
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 7d4:	31 ff                	xor    %edi,%edi
{
 7d6:	56                   	push   %esi
 7d7:	53                   	push   %ebx
 7d8:	83 ec 3c             	sub    $0x3c,%esp
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 7db:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  ap = (uint*)(void*)&fmt + 1;
 7de:	8d 45 10             	lea    0x10(%ebp),%eax
{
 7e1:	8b 75 08             	mov    0x8(%ebp),%esi
  ap = (uint*)(void*)&fmt + 1;
 7e4:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  for(i = 0; fmt[i]; i++){
 7e7:	0f b6 13             	movzbl (%ebx),%edx
 7ea:	83 c3 01             	add    $0x1,%ebx
 7ed:	84 d2                	test   %dl,%dl
 7ef:	75 39                	jne    82a <printf+0x5a>
 7f1:	e9 c2 00 00 00       	jmp    8b8 <printf+0xe8>
 7f6:	66 90                	xchg   %ax,%ax
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 7f8:	83 fa 25             	cmp    $0x25,%edx
 7fb:	0f 84 bf 00 00 00    	je     8c0 <printf+0xf0>
  write(fd, &c, 1);
 801:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 804:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 80b:	00 
 80c:	89 44 24 04          	mov    %eax,0x4(%esp)
 810:	89 34 24             	mov    %esi,(%esp)
        state = '%';
      } else {
        putc(fd, c);
 813:	88 55 e2             	mov    %dl,-0x1e(%ebp)
  write(fd, &c, 1);
 816:	e8 8f fe ff ff       	call   6aa <write>
 81b:	83 c3 01             	add    $0x1,%ebx
  for(i = 0; fmt[i]; i++){
 81e:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 822:	84 d2                	test   %dl,%dl
 824:	0f 84 8e 00 00 00    	je     8b8 <printf+0xe8>
    if(state == 0){
 82a:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
 82c:	0f be c2             	movsbl %dl,%eax
    if(state == 0){
 82f:	74 c7                	je     7f8 <printf+0x28>
      }
    } else if(state == '%'){
 831:	83 ff 25             	cmp    $0x25,%edi
 834:	75 e5                	jne    81b <printf+0x4b>
      if(c == 'd'){
 836:	83 fa 64             	cmp    $0x64,%edx
 839:	0f 84 31 01 00 00    	je     970 <printf+0x1a0>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 83f:	25 f7 00 00 00       	and    $0xf7,%eax
 844:	83 f8 70             	cmp    $0x70,%eax
 847:	0f 84 83 00 00 00    	je     8d0 <printf+0x100>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 84d:	83 fa 73             	cmp    $0x73,%edx
 850:	0f 84 a2 00 00 00    	je     8f8 <printf+0x128>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 856:	83 fa 63             	cmp    $0x63,%edx
 859:	0f 84 35 01 00 00    	je     994 <printf+0x1c4>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 85f:	83 fa 25             	cmp    $0x25,%edx
 862:	0f 84 e0 00 00 00    	je     948 <printf+0x178>
  write(fd, &c, 1);
 868:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 86b:	83 c3 01             	add    $0x1,%ebx
 86e:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 875:	00 
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 876:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 878:	89 44 24 04          	mov    %eax,0x4(%esp)
 87c:	89 34 24             	mov    %esi,(%esp)
 87f:	89 55 d0             	mov    %edx,-0x30(%ebp)
 882:	c6 45 e6 25          	movb   $0x25,-0x1a(%ebp)
 886:	e8 1f fe ff ff       	call   6aa <write>
        putc(fd, c);
 88b:	8b 55 d0             	mov    -0x30(%ebp),%edx
  write(fd, &c, 1);
 88e:	8d 45 e7             	lea    -0x19(%ebp),%eax
 891:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 898:	00 
 899:	89 44 24 04          	mov    %eax,0x4(%esp)
 89d:	89 34 24             	mov    %esi,(%esp)
        putc(fd, c);
 8a0:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 8a3:	e8 02 fe ff ff       	call   6aa <write>
  for(i = 0; fmt[i]; i++){
 8a8:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 8ac:	84 d2                	test   %dl,%dl
 8ae:	0f 85 76 ff ff ff    	jne    82a <printf+0x5a>
 8b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    }
  }
}
 8b8:	83 c4 3c             	add    $0x3c,%esp
 8bb:	5b                   	pop    %ebx
 8bc:	5e                   	pop    %esi
 8bd:	5f                   	pop    %edi
 8be:	5d                   	pop    %ebp
 8bf:	c3                   	ret    
        state = '%';
 8c0:	bf 25 00 00 00       	mov    $0x25,%edi
 8c5:	e9 51 ff ff ff       	jmp    81b <printf+0x4b>
 8ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 8d0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 8d3:	b9 10 00 00 00       	mov    $0x10,%ecx
      state = 0;
 8d8:	31 ff                	xor    %edi,%edi
        printint(fd, *ap, 16, 0);
 8da:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 8e1:	8b 10                	mov    (%eax),%edx
 8e3:	89 f0                	mov    %esi,%eax
 8e5:	e8 46 fe ff ff       	call   730 <printint>
        ap++;
 8ea:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 8ee:	e9 28 ff ff ff       	jmp    81b <printf+0x4b>
 8f3:	90                   	nop
 8f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 8f8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
        ap++;
 8fb:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
        s = (char*)*ap;
 8ff:	8b 38                	mov    (%eax),%edi
          s = "(null)";
 901:	b8 ed 0d 00 00       	mov    $0xded,%eax
 906:	85 ff                	test   %edi,%edi
 908:	0f 44 f8             	cmove  %eax,%edi
        while(*s != 0){
 90b:	0f b6 07             	movzbl (%edi),%eax
 90e:	84 c0                	test   %al,%al
 910:	74 2a                	je     93c <printf+0x16c>
 912:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 918:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
 91b:	8d 45 e3             	lea    -0x1d(%ebp),%eax
          s++;
 91e:	83 c7 01             	add    $0x1,%edi
  write(fd, &c, 1);
 921:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 928:	00 
 929:	89 44 24 04          	mov    %eax,0x4(%esp)
 92d:	89 34 24             	mov    %esi,(%esp)
 930:	e8 75 fd ff ff       	call   6aa <write>
        while(*s != 0){
 935:	0f b6 07             	movzbl (%edi),%eax
 938:	84 c0                	test   %al,%al
 93a:	75 dc                	jne    918 <printf+0x148>
      state = 0;
 93c:	31 ff                	xor    %edi,%edi
 93e:	e9 d8 fe ff ff       	jmp    81b <printf+0x4b>
 943:	90                   	nop
 944:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 948:	8d 45 e5             	lea    -0x1b(%ebp),%eax
      state = 0;
 94b:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 94d:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 954:	00 
 955:	89 44 24 04          	mov    %eax,0x4(%esp)
 959:	89 34 24             	mov    %esi,(%esp)
 95c:	c6 45 e5 25          	movb   $0x25,-0x1b(%ebp)
 960:	e8 45 fd ff ff       	call   6aa <write>
 965:	e9 b1 fe ff ff       	jmp    81b <printf+0x4b>
 96a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 970:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 973:	b9 0a 00 00 00       	mov    $0xa,%ecx
      state = 0;
 978:	66 31 ff             	xor    %di,%di
        printint(fd, *ap, 10, 1);
 97b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 982:	8b 10                	mov    (%eax),%edx
 984:	89 f0                	mov    %esi,%eax
 986:	e8 a5 fd ff ff       	call   730 <printint>
        ap++;
 98b:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 98f:	e9 87 fe ff ff       	jmp    81b <printf+0x4b>
        putc(fd, *ap);
 994:	8b 45 d4             	mov    -0x2c(%ebp),%eax
      state = 0;
 997:	31 ff                	xor    %edi,%edi
        putc(fd, *ap);
 999:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 99b:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 9a2:	00 
 9a3:	89 34 24             	mov    %esi,(%esp)
        putc(fd, *ap);
 9a6:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
 9a9:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 9ac:	89 44 24 04          	mov    %eax,0x4(%esp)
 9b0:	e8 f5 fc ff ff       	call   6aa <write>
        ap++;
 9b5:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 9b9:	e9 5d fe ff ff       	jmp    81b <printf+0x4b>
 9be:	66 90                	xchg   %ax,%ax

000009c0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 9c0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9c1:	a1 c8 10 00 00       	mov    0x10c8,%eax
{
 9c6:	89 e5                	mov    %esp,%ebp
 9c8:	57                   	push   %edi
 9c9:	56                   	push   %esi
 9ca:	53                   	push   %ebx
 9cb:	8b 5d 08             	mov    0x8(%ebp),%ebx
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 9ce:	8b 08                	mov    (%eax),%ecx
  bp = (Header*)ap - 1;
 9d0:	8d 53 f8             	lea    -0x8(%ebx),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9d3:	39 d0                	cmp    %edx,%eax
 9d5:	72 11                	jb     9e8 <free+0x28>
 9d7:	90                   	nop
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 9d8:	39 c8                	cmp    %ecx,%eax
 9da:	72 04                	jb     9e0 <free+0x20>
 9dc:	39 ca                	cmp    %ecx,%edx
 9de:	72 10                	jb     9f0 <free+0x30>
 9e0:	89 c8                	mov    %ecx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9e2:	39 d0                	cmp    %edx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 9e4:	8b 08                	mov    (%eax),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9e6:	73 f0                	jae    9d8 <free+0x18>
 9e8:	39 ca                	cmp    %ecx,%edx
 9ea:	72 04                	jb     9f0 <free+0x30>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 9ec:	39 c8                	cmp    %ecx,%eax
 9ee:	72 f0                	jb     9e0 <free+0x20>
      break;
  if(bp + bp->s.size == p->s.ptr){
 9f0:	8b 73 fc             	mov    -0x4(%ebx),%esi
 9f3:	8d 3c f2             	lea    (%edx,%esi,8),%edi
 9f6:	39 cf                	cmp    %ecx,%edi
 9f8:	74 1e                	je     a18 <free+0x58>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 9fa:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
 9fd:	8b 48 04             	mov    0x4(%eax),%ecx
 a00:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
 a03:	39 f2                	cmp    %esi,%edx
 a05:	74 28                	je     a2f <free+0x6f>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 a07:	89 10                	mov    %edx,(%eax)
  freep = p;
 a09:	a3 c8 10 00 00       	mov    %eax,0x10c8
}
 a0e:	5b                   	pop    %ebx
 a0f:	5e                   	pop    %esi
 a10:	5f                   	pop    %edi
 a11:	5d                   	pop    %ebp
 a12:	c3                   	ret    
 a13:	90                   	nop
 a14:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 a18:	03 71 04             	add    0x4(%ecx),%esi
 a1b:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 a1e:	8b 08                	mov    (%eax),%ecx
 a20:	8b 09                	mov    (%ecx),%ecx
 a22:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
 a25:	8b 48 04             	mov    0x4(%eax),%ecx
 a28:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
 a2b:	39 f2                	cmp    %esi,%edx
 a2d:	75 d8                	jne    a07 <free+0x47>
    p->s.size += bp->s.size;
 a2f:	03 4b fc             	add    -0x4(%ebx),%ecx
  freep = p;
 a32:	a3 c8 10 00 00       	mov    %eax,0x10c8
    p->s.size += bp->s.size;
 a37:	89 48 04             	mov    %ecx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 a3a:	8b 53 f8             	mov    -0x8(%ebx),%edx
 a3d:	89 10                	mov    %edx,(%eax)
}
 a3f:	5b                   	pop    %ebx
 a40:	5e                   	pop    %esi
 a41:	5f                   	pop    %edi
 a42:	5d                   	pop    %ebp
 a43:	c3                   	ret    
 a44:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 a4a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000a50 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 a50:	55                   	push   %ebp
 a51:	89 e5                	mov    %esp,%ebp
 a53:	57                   	push   %edi
 a54:	56                   	push   %esi
 a55:	53                   	push   %ebx
 a56:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a59:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 a5c:	8b 1d c8 10 00 00    	mov    0x10c8,%ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a62:	8d 48 07             	lea    0x7(%eax),%ecx
 a65:	c1 e9 03             	shr    $0x3,%ecx
  if((prevp = freep) == 0){
 a68:	85 db                	test   %ebx,%ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a6a:	8d 71 01             	lea    0x1(%ecx),%esi
  if((prevp = freep) == 0){
 a6d:	0f 84 9b 00 00 00    	je     b0e <malloc+0xbe>
 a73:	8b 13                	mov    (%ebx),%edx
 a75:	8b 7a 04             	mov    0x4(%edx),%edi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 a78:	39 fe                	cmp    %edi,%esi
 a7a:	76 64                	jbe    ae0 <malloc+0x90>
 a7c:	8d 04 f5 00 00 00 00 	lea    0x0(,%esi,8),%eax
  if(nu < 4096)
 a83:	bb 00 80 00 00       	mov    $0x8000,%ebx
 a88:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 a8b:	eb 0e                	jmp    a9b <malloc+0x4b>
 a8d:	8d 76 00             	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a90:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 a92:	8b 78 04             	mov    0x4(%eax),%edi
 a95:	39 fe                	cmp    %edi,%esi
 a97:	76 4f                	jbe    ae8 <malloc+0x98>
 a99:	89 c2                	mov    %eax,%edx
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 a9b:	3b 15 c8 10 00 00    	cmp    0x10c8,%edx
 aa1:	75 ed                	jne    a90 <malloc+0x40>
  if(nu < 4096)
 aa3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 aa6:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 aac:	bf 00 10 00 00       	mov    $0x1000,%edi
 ab1:	0f 43 fe             	cmovae %esi,%edi
 ab4:	0f 42 c3             	cmovb  %ebx,%eax
  p = sbrk(nu * sizeof(Header));
 ab7:	89 04 24             	mov    %eax,(%esp)
 aba:	e8 53 fc ff ff       	call   712 <sbrk>
  if(p == (char*)-1)
 abf:	83 f8 ff             	cmp    $0xffffffff,%eax
 ac2:	74 18                	je     adc <malloc+0x8c>
  hp->s.size = nu;
 ac4:	89 78 04             	mov    %edi,0x4(%eax)
  free((void*)(hp + 1));
 ac7:	83 c0 08             	add    $0x8,%eax
 aca:	89 04 24             	mov    %eax,(%esp)
 acd:	e8 ee fe ff ff       	call   9c0 <free>
  return freep;
 ad2:	8b 15 c8 10 00 00    	mov    0x10c8,%edx
      if((p = morecore(nunits)) == 0)
 ad8:	85 d2                	test   %edx,%edx
 ada:	75 b4                	jne    a90 <malloc+0x40>
        return 0;
 adc:	31 c0                	xor    %eax,%eax
 ade:	eb 20                	jmp    b00 <malloc+0xb0>
    if(p->s.size >= nunits){
 ae0:	89 d0                	mov    %edx,%eax
 ae2:	89 da                	mov    %ebx,%edx
 ae4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 ae8:	39 fe                	cmp    %edi,%esi
 aea:	74 1c                	je     b08 <malloc+0xb8>
        p->s.size -= nunits;
 aec:	29 f7                	sub    %esi,%edi
 aee:	89 78 04             	mov    %edi,0x4(%eax)
        p += p->s.size;
 af1:	8d 04 f8             	lea    (%eax,%edi,8),%eax
        p->s.size = nunits;
 af4:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 af7:	89 15 c8 10 00 00    	mov    %edx,0x10c8
      return (void*)(p + 1);
 afd:	83 c0 08             	add    $0x8,%eax
  }
}
 b00:	83 c4 1c             	add    $0x1c,%esp
 b03:	5b                   	pop    %ebx
 b04:	5e                   	pop    %esi
 b05:	5f                   	pop    %edi
 b06:	5d                   	pop    %ebp
 b07:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 b08:	8b 08                	mov    (%eax),%ecx
 b0a:	89 0a                	mov    %ecx,(%edx)
 b0c:	eb e9                	jmp    af7 <malloc+0xa7>
    base.s.ptr = freep = prevp = &base;
 b0e:	c7 05 c8 10 00 00 cc 	movl   $0x10cc,0x10c8
 b15:	10 00 00 
    base.s.size = 0;
 b18:	ba cc 10 00 00       	mov    $0x10cc,%edx
    base.s.ptr = freep = prevp = &base;
 b1d:	c7 05 cc 10 00 00 cc 	movl   $0x10cc,0x10cc
 b24:	10 00 00 
    base.s.size = 0;
 b27:	c7 05 d0 10 00 00 00 	movl   $0x0,0x10d0
 b2e:	00 00 00 
 b31:	e9 46 ff ff ff       	jmp    a7c <malloc+0x2c>

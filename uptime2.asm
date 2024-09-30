
_uptime2:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
    Failure to follow this instruction will lead to zero point 
	for this part */

int 
main(int argc, char * argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	53                   	push   %ebx
   e:	51                   	push   %ecx
   f:	8b 41 04             	mov    0x4(%ecx),%eax
	int i = atoi(argv[1]);
  12:	83 ec 0c             	sub    $0xc,%esp
  15:	ff 70 04             	push   0x4(%eax)
  18:	e8 53 02 00 00       	call   270 <atoi>
    
    // "msg" now holds the shutdown message provided by the user
    //shutdown2(msg);
	
    if(i<1 || i>3)
  1d:	83 c4 10             	add    $0x10,%esp
	int i = atoi(argv[1]);
  20:	89 c3                	mov    %eax,%ebx
    if(i<1 || i>3)
  22:	83 e8 01             	sub    $0x1,%eax
  25:	83 f8 02             	cmp    $0x2,%eax
  28:	77 3f                	ja     69 <main+0x69>
        printf(1,"Available options for uptime output: \n[\n1=seconds,\n2=days,\n3=years\n]");
    
    uint ut = uptime2(i);
  2a:	83 ec 0c             	sub    $0xc,%esp
  2d:	53                   	push   %ebx
  2e:	e8 68 03 00 00       	call   39b <uptime2>

    if(i == 1){
  33:	83 c4 10             	add    $0x10,%esp
  36:	83 fb 01             	cmp    $0x1,%ebx
  39:	74 18                	je     53 <main+0x53>
        printf(1, "Current Uptime in ticks: %d", ut);
    } else if(i == 2){
  3b:	83 fb 02             	cmp    $0x2,%ebx
  3e:	74 44                	je     84 <main+0x84>
        printf(1, "Current Uptime in seconds: %d", ut);
    } else if(i == 3){
        printf(1, "Current Uptime in minutes: %d", ut);
  40:	52                   	push   %edx
  41:	50                   	push   %eax
  42:	68 07 08 00 00       	push   $0x807
  47:	6a 01                	push   $0x1
  49:	e8 12 04 00 00       	call   460 <printf>
  4e:	83 c4 10             	add    $0x10,%esp
  51:	eb 11                	jmp    64 <main+0x64>
        printf(1, "Current Uptime in ticks: %d", ut);
  53:	53                   	push   %ebx
  54:	50                   	push   %eax
  55:	68 cd 07 00 00       	push   $0x7cd
  5a:	6a 01                	push   $0x1
  5c:	e8 ff 03 00 00       	call   460 <printf>
  61:	83 c4 10             	add    $0x10,%esp
    }

    exit(); //return 0;
  64:	e8 7a 02 00 00       	call   2e3 <exit>
        printf(1,"Available options for uptime output: \n[\n1=seconds,\n2=days,\n3=years\n]");
  69:	50                   	push   %eax
  6a:	50                   	push   %eax
  6b:	68 88 07 00 00       	push   $0x788
  70:	6a 01                	push   $0x1
  72:	e8 e9 03 00 00       	call   460 <printf>
    uint ut = uptime2(i);
  77:	89 1c 24             	mov    %ebx,(%esp)
  7a:	e8 1c 03 00 00       	call   39b <uptime2>
    } else if(i == 3){
  7f:	83 c4 10             	add    $0x10,%esp
  82:	eb e0                	jmp    64 <main+0x64>
        printf(1, "Current Uptime in seconds: %d", ut);
  84:	51                   	push   %ecx
  85:	50                   	push   %eax
  86:	68 e9 07 00 00       	push   $0x7e9
  8b:	6a 01                	push   $0x1
  8d:	e8 ce 03 00 00       	call   460 <printf>
  92:	83 c4 10             	add    $0x10,%esp
  95:	eb cd                	jmp    64 <main+0x64>
  97:	66 90                	xchg   %ax,%ax
  99:	66 90                	xchg   %ax,%ax
  9b:	66 90                	xchg   %ax,%ax
  9d:	66 90                	xchg   %ax,%ax
  9f:	90                   	nop

000000a0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  a0:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  a1:	31 c0                	xor    %eax,%eax
{
  a3:	89 e5                	mov    %esp,%ebp
  a5:	53                   	push   %ebx
  a6:	8b 4d 08             	mov    0x8(%ebp),%ecx
  a9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
  b0:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  b4:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  b7:	83 c0 01             	add    $0x1,%eax
  ba:	84 d2                	test   %dl,%dl
  bc:	75 f2                	jne    b0 <strcpy+0x10>
    ;
  return os;
}
  be:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  c1:	89 c8                	mov    %ecx,%eax
  c3:	c9                   	leave
  c4:	c3                   	ret
  c5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000000d0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  d0:	55                   	push   %ebp
  d1:	89 e5                	mov    %esp,%ebp
  d3:	53                   	push   %ebx
  d4:	8b 55 08             	mov    0x8(%ebp),%edx
  d7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
  da:	0f b6 02             	movzbl (%edx),%eax
  dd:	84 c0                	test   %al,%al
  df:	75 17                	jne    f8 <strcmp+0x28>
  e1:	eb 3a                	jmp    11d <strcmp+0x4d>
  e3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  e7:	90                   	nop
  e8:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
  ec:	83 c2 01             	add    $0x1,%edx
  ef:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
  f2:	84 c0                	test   %al,%al
  f4:	74 1a                	je     110 <strcmp+0x40>
    p++, q++;
  f6:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
  f8:	0f b6 19             	movzbl (%ecx),%ebx
  fb:	38 c3                	cmp    %al,%bl
  fd:	74 e9                	je     e8 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
  ff:	29 d8                	sub    %ebx,%eax
}
 101:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 104:	c9                   	leave
 105:	c3                   	ret
 106:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 10d:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
 110:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 114:	31 c0                	xor    %eax,%eax
 116:	29 d8                	sub    %ebx,%eax
}
 118:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 11b:	c9                   	leave
 11c:	c3                   	ret
  return (uchar)*p - (uchar)*q;
 11d:	0f b6 19             	movzbl (%ecx),%ebx
 120:	31 c0                	xor    %eax,%eax
 122:	eb db                	jmp    ff <strcmp+0x2f>
 124:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 12b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 12f:	90                   	nop

00000130 <strlen>:

uint
strlen(char *s)
{
 130:	55                   	push   %ebp
 131:	89 e5                	mov    %esp,%ebp
 133:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 136:	80 3a 00             	cmpb   $0x0,(%edx)
 139:	74 15                	je     150 <strlen+0x20>
 13b:	31 c0                	xor    %eax,%eax
 13d:	8d 76 00             	lea    0x0(%esi),%esi
 140:	83 c0 01             	add    $0x1,%eax
 143:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 147:	89 c1                	mov    %eax,%ecx
 149:	75 f5                	jne    140 <strlen+0x10>
    ;
  return n;
}
 14b:	89 c8                	mov    %ecx,%eax
 14d:	5d                   	pop    %ebp
 14e:	c3                   	ret
 14f:	90                   	nop
  for(n = 0; s[n]; n++)
 150:	31 c9                	xor    %ecx,%ecx
}
 152:	5d                   	pop    %ebp
 153:	89 c8                	mov    %ecx,%eax
 155:	c3                   	ret
 156:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 15d:	8d 76 00             	lea    0x0(%esi),%esi

00000160 <memset>:

void*
memset(void *dst, int c, uint n)
{
 160:	55                   	push   %ebp
 161:	89 e5                	mov    %esp,%ebp
 163:	57                   	push   %edi
 164:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 167:	8b 4d 10             	mov    0x10(%ebp),%ecx
 16a:	8b 45 0c             	mov    0xc(%ebp),%eax
 16d:	89 d7                	mov    %edx,%edi
 16f:	fc                   	cld
 170:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 172:	8b 7d fc             	mov    -0x4(%ebp),%edi
 175:	89 d0                	mov    %edx,%eax
 177:	c9                   	leave
 178:	c3                   	ret
 179:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000180 <strchr>:

char*
strchr(const char *s, char c)
{
 180:	55                   	push   %ebp
 181:	89 e5                	mov    %esp,%ebp
 183:	8b 45 08             	mov    0x8(%ebp),%eax
 186:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 18a:	0f b6 10             	movzbl (%eax),%edx
 18d:	84 d2                	test   %dl,%dl
 18f:	75 12                	jne    1a3 <strchr+0x23>
 191:	eb 1d                	jmp    1b0 <strchr+0x30>
 193:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 197:	90                   	nop
 198:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 19c:	83 c0 01             	add    $0x1,%eax
 19f:	84 d2                	test   %dl,%dl
 1a1:	74 0d                	je     1b0 <strchr+0x30>
    if(*s == c)
 1a3:	38 d1                	cmp    %dl,%cl
 1a5:	75 f1                	jne    198 <strchr+0x18>
      return (char*)s;
  return 0;
}
 1a7:	5d                   	pop    %ebp
 1a8:	c3                   	ret
 1a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 1b0:	31 c0                	xor    %eax,%eax
}
 1b2:	5d                   	pop    %ebp
 1b3:	c3                   	ret
 1b4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1bb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1bf:	90                   	nop

000001c0 <gets>:

char*
gets(char *buf, int max)
{
 1c0:	55                   	push   %ebp
 1c1:	89 e5                	mov    %esp,%ebp
 1c3:	57                   	push   %edi
 1c4:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 1c5:	8d 75 e7             	lea    -0x19(%ebp),%esi
{
 1c8:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 1c9:	31 db                	xor    %ebx,%ebx
{
 1cb:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 1ce:	eb 27                	jmp    1f7 <gets+0x37>
    cc = read(0, &c, 1);
 1d0:	83 ec 04             	sub    $0x4,%esp
 1d3:	6a 01                	push   $0x1
 1d5:	56                   	push   %esi
 1d6:	6a 00                	push   $0x0
 1d8:	e8 1e 01 00 00       	call   2fb <read>
    if(cc < 1)
 1dd:	83 c4 10             	add    $0x10,%esp
 1e0:	85 c0                	test   %eax,%eax
 1e2:	7e 1d                	jle    201 <gets+0x41>
      break;
    buf[i++] = c;
 1e4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 1e8:	8b 55 08             	mov    0x8(%ebp),%edx
 1eb:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 1ef:	3c 0a                	cmp    $0xa,%al
 1f1:	74 10                	je     203 <gets+0x43>
 1f3:	3c 0d                	cmp    $0xd,%al
 1f5:	74 0c                	je     203 <gets+0x43>
  for(i=0; i+1 < max; ){
 1f7:	89 df                	mov    %ebx,%edi
 1f9:	83 c3 01             	add    $0x1,%ebx
 1fc:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1ff:	7c cf                	jl     1d0 <gets+0x10>
 201:	89 fb                	mov    %edi,%ebx
      break;
  }
  buf[i] = '\0';
 203:	8b 45 08             	mov    0x8(%ebp),%eax
 206:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
  return buf;
}
 20a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 20d:	5b                   	pop    %ebx
 20e:	5e                   	pop    %esi
 20f:	5f                   	pop    %edi
 210:	5d                   	pop    %ebp
 211:	c3                   	ret
 212:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 219:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000220 <stat>:

int
stat(char *n, struct stat *st)
{
 220:	55                   	push   %ebp
 221:	89 e5                	mov    %esp,%ebp
 223:	56                   	push   %esi
 224:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 225:	83 ec 08             	sub    $0x8,%esp
 228:	6a 00                	push   $0x0
 22a:	ff 75 08             	push   0x8(%ebp)
 22d:	e8 f1 00 00 00       	call   323 <open>
  if(fd < 0)
 232:	83 c4 10             	add    $0x10,%esp
 235:	85 c0                	test   %eax,%eax
 237:	78 27                	js     260 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 239:	83 ec 08             	sub    $0x8,%esp
 23c:	ff 75 0c             	push   0xc(%ebp)
 23f:	89 c3                	mov    %eax,%ebx
 241:	50                   	push   %eax
 242:	e8 f4 00 00 00       	call   33b <fstat>
  close(fd);
 247:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 24a:	89 c6                	mov    %eax,%esi
  close(fd);
 24c:	e8 ba 00 00 00       	call   30b <close>
  return r;
 251:	83 c4 10             	add    $0x10,%esp
}
 254:	8d 65 f8             	lea    -0x8(%ebp),%esp
 257:	89 f0                	mov    %esi,%eax
 259:	5b                   	pop    %ebx
 25a:	5e                   	pop    %esi
 25b:	5d                   	pop    %ebp
 25c:	c3                   	ret
 25d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 260:	be ff ff ff ff       	mov    $0xffffffff,%esi
 265:	eb ed                	jmp    254 <stat+0x34>
 267:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 26e:	66 90                	xchg   %ax,%ax

00000270 <atoi>:

int
atoi(const char *s)
{
 270:	55                   	push   %ebp
 271:	89 e5                	mov    %esp,%ebp
 273:	53                   	push   %ebx
 274:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 277:	0f be 02             	movsbl (%edx),%eax
 27a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 27d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 280:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 285:	77 1e                	ja     2a5 <atoi+0x35>
 287:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 28e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 290:	83 c2 01             	add    $0x1,%edx
 293:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 296:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 29a:	0f be 02             	movsbl (%edx),%eax
 29d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 2a0:	80 fb 09             	cmp    $0x9,%bl
 2a3:	76 eb                	jbe    290 <atoi+0x20>
  return n;
}
 2a5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2a8:	89 c8                	mov    %ecx,%eax
 2aa:	c9                   	leave
 2ab:	c3                   	ret
 2ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000002b0 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 2b0:	55                   	push   %ebp
 2b1:	89 e5                	mov    %esp,%ebp
 2b3:	57                   	push   %edi
 2b4:	56                   	push   %esi
 2b5:	8b 45 10             	mov    0x10(%ebp),%eax
 2b8:	8b 55 08             	mov    0x8(%ebp),%edx
 2bb:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2be:	85 c0                	test   %eax,%eax
 2c0:	7e 13                	jle    2d5 <memmove+0x25>
 2c2:	01 d0                	add    %edx,%eax
  dst = vdst;
 2c4:	89 d7                	mov    %edx,%edi
 2c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2cd:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 2d0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 2d1:	39 f8                	cmp    %edi,%eax
 2d3:	75 fb                	jne    2d0 <memmove+0x20>
  return vdst;
}
 2d5:	5e                   	pop    %esi
 2d6:	89 d0                	mov    %edx,%eax
 2d8:	5f                   	pop    %edi
 2d9:	5d                   	pop    %ebp
 2da:	c3                   	ret

000002db <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2db:	b8 01 00 00 00       	mov    $0x1,%eax
 2e0:	cd 40                	int    $0x40
 2e2:	c3                   	ret

000002e3 <exit>:
SYSCALL(exit)
 2e3:	b8 02 00 00 00       	mov    $0x2,%eax
 2e8:	cd 40                	int    $0x40
 2ea:	c3                   	ret

000002eb <wait>:
SYSCALL(wait)
 2eb:	b8 03 00 00 00       	mov    $0x3,%eax
 2f0:	cd 40                	int    $0x40
 2f2:	c3                   	ret

000002f3 <pipe>:
SYSCALL(pipe)
 2f3:	b8 04 00 00 00       	mov    $0x4,%eax
 2f8:	cd 40                	int    $0x40
 2fa:	c3                   	ret

000002fb <read>:
SYSCALL(read)
 2fb:	b8 05 00 00 00       	mov    $0x5,%eax
 300:	cd 40                	int    $0x40
 302:	c3                   	ret

00000303 <write>:
SYSCALL(write)
 303:	b8 10 00 00 00       	mov    $0x10,%eax
 308:	cd 40                	int    $0x40
 30a:	c3                   	ret

0000030b <close>:
SYSCALL(close)
 30b:	b8 15 00 00 00       	mov    $0x15,%eax
 310:	cd 40                	int    $0x40
 312:	c3                   	ret

00000313 <kill>:
SYSCALL(kill)
 313:	b8 06 00 00 00       	mov    $0x6,%eax
 318:	cd 40                	int    $0x40
 31a:	c3                   	ret

0000031b <exec>:
SYSCALL(exec)
 31b:	b8 07 00 00 00       	mov    $0x7,%eax
 320:	cd 40                	int    $0x40
 322:	c3                   	ret

00000323 <open>:
SYSCALL(open)
 323:	b8 0f 00 00 00       	mov    $0xf,%eax
 328:	cd 40                	int    $0x40
 32a:	c3                   	ret

0000032b <mknod>:
SYSCALL(mknod)
 32b:	b8 11 00 00 00       	mov    $0x11,%eax
 330:	cd 40                	int    $0x40
 332:	c3                   	ret

00000333 <unlink>:
SYSCALL(unlink)
 333:	b8 12 00 00 00       	mov    $0x12,%eax
 338:	cd 40                	int    $0x40
 33a:	c3                   	ret

0000033b <fstat>:
SYSCALL(fstat)
 33b:	b8 08 00 00 00       	mov    $0x8,%eax
 340:	cd 40                	int    $0x40
 342:	c3                   	ret

00000343 <link>:
SYSCALL(link)
 343:	b8 13 00 00 00       	mov    $0x13,%eax
 348:	cd 40                	int    $0x40
 34a:	c3                   	ret

0000034b <mkdir>:
SYSCALL(mkdir)
 34b:	b8 14 00 00 00       	mov    $0x14,%eax
 350:	cd 40                	int    $0x40
 352:	c3                   	ret

00000353 <chdir>:
SYSCALL(chdir)
 353:	b8 09 00 00 00       	mov    $0x9,%eax
 358:	cd 40                	int    $0x40
 35a:	c3                   	ret

0000035b <dup>:
SYSCALL(dup)
 35b:	b8 0a 00 00 00       	mov    $0xa,%eax
 360:	cd 40                	int    $0x40
 362:	c3                   	ret

00000363 <getpid>:
SYSCALL(getpid)
 363:	b8 0b 00 00 00       	mov    $0xb,%eax
 368:	cd 40                	int    $0x40
 36a:	c3                   	ret

0000036b <sbrk>:
SYSCALL(sbrk)
 36b:	b8 0c 00 00 00       	mov    $0xc,%eax
 370:	cd 40                	int    $0x40
 372:	c3                   	ret

00000373 <sleep>:
SYSCALL(sleep)
 373:	b8 0d 00 00 00       	mov    $0xd,%eax
 378:	cd 40                	int    $0x40
 37a:	c3                   	ret

0000037b <uptime>:
SYSCALL(uptime)
 37b:	b8 0e 00 00 00       	mov    $0xe,%eax
 380:	cd 40                	int    $0x40
 382:	c3                   	ret

00000383 <shutdown>:
SYSCALL(shutdown)
 383:	b8 16 00 00 00       	mov    $0x16,%eax
 388:	cd 40                	int    $0x40
 38a:	c3                   	ret

0000038b <shutdown2>:
SYSCALL(shutdown2)
 38b:	b8 17 00 00 00       	mov    $0x17,%eax
 390:	cd 40                	int    $0x40
 392:	c3                   	ret

00000393 <exit2>:
SYSCALL(exit2)
 393:	b8 18 00 00 00       	mov    $0x18,%eax
 398:	cd 40                	int    $0x40
 39a:	c3                   	ret

0000039b <uptime2>:
SYSCALL(uptime2)
 39b:	b8 19 00 00 00       	mov    $0x19,%eax
 3a0:	cd 40                	int    $0x40
 3a2:	c3                   	ret

000003a3 <mkdir2>:
SYSCALL(mkdir2)
 3a3:	b8 1a 00 00 00       	mov    $0x1a,%eax
 3a8:	cd 40                	int    $0x40
 3aa:	c3                   	ret

000003ab <getppid>:
SYSCALL(getppid)
 3ab:	b8 1b 00 00 00       	mov    $0x1b,%eax
 3b0:	cd 40                	int    $0x40
 3b2:	c3                   	ret
 3b3:	66 90                	xchg   %ax,%ax
 3b5:	66 90                	xchg   %ax,%ax
 3b7:	66 90                	xchg   %ax,%ax
 3b9:	66 90                	xchg   %ax,%ax
 3bb:	66 90                	xchg   %ax,%ax
 3bd:	66 90                	xchg   %ax,%ax
 3bf:	90                   	nop

000003c0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 3c0:	55                   	push   %ebp
 3c1:	89 e5                	mov    %esp,%ebp
 3c3:	57                   	push   %edi
 3c4:	56                   	push   %esi
 3c5:	53                   	push   %ebx
 3c6:	89 cb                	mov    %ecx,%ebx
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 3c8:	89 d1                	mov    %edx,%ecx
{
 3ca:	83 ec 3c             	sub    $0x3c,%esp
 3cd:	89 45 c0             	mov    %eax,-0x40(%ebp)
  if(sgn && xx < 0){
 3d0:	85 d2                	test   %edx,%edx
 3d2:	0f 89 80 00 00 00    	jns    458 <printint+0x98>
 3d8:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 3dc:	74 7a                	je     458 <printint+0x98>
    x = -xx;
 3de:	f7 d9                	neg    %ecx
    neg = 1;
 3e0:	b8 01 00 00 00       	mov    $0x1,%eax
  } else {
    x = xx;
  }

  i = 0;
 3e5:	89 45 c4             	mov    %eax,-0x3c(%ebp)
 3e8:	31 f6                	xor    %esi,%esi
 3ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 3f0:	89 c8                	mov    %ecx,%eax
 3f2:	31 d2                	xor    %edx,%edx
 3f4:	89 f7                	mov    %esi,%edi
 3f6:	f7 f3                	div    %ebx
 3f8:	8d 76 01             	lea    0x1(%esi),%esi
 3fb:	0f b6 92 84 08 00 00 	movzbl 0x884(%edx),%edx
 402:	88 54 35 d7          	mov    %dl,-0x29(%ebp,%esi,1)
  }while((x /= base) != 0);
 406:	89 ca                	mov    %ecx,%edx
 408:	89 c1                	mov    %eax,%ecx
 40a:	39 da                	cmp    %ebx,%edx
 40c:	73 e2                	jae    3f0 <printint+0x30>
  if(neg)
 40e:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 411:	85 c0                	test   %eax,%eax
 413:	74 07                	je     41c <printint+0x5c>
    buf[i++] = '-';
 415:	c6 44 35 d8 2d       	movb   $0x2d,-0x28(%ebp,%esi,1)
    buf[i++] = digits[x % base];
 41a:	89 f7                	mov    %esi,%edi
 41c:	8d 5d d8             	lea    -0x28(%ebp),%ebx
 41f:	8b 75 c0             	mov    -0x40(%ebp),%esi
 422:	01 df                	add    %ebx,%edi
 424:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  while(--i >= 0)
    putc(fd, buf[i]);
 428:	0f b6 07             	movzbl (%edi),%eax
  write(fd, &c, 1);
 42b:	83 ec 04             	sub    $0x4,%esp
 42e:	88 45 d7             	mov    %al,-0x29(%ebp)
 431:	8d 45 d7             	lea    -0x29(%ebp),%eax
 434:	6a 01                	push   $0x1
 436:	50                   	push   %eax
 437:	56                   	push   %esi
 438:	e8 c6 fe ff ff       	call   303 <write>
  while(--i >= 0)
 43d:	89 f8                	mov    %edi,%eax
 43f:	83 c4 10             	add    $0x10,%esp
 442:	83 ef 01             	sub    $0x1,%edi
 445:	39 d8                	cmp    %ebx,%eax
 447:	75 df                	jne    428 <printint+0x68>
}
 449:	8d 65 f4             	lea    -0xc(%ebp),%esp
 44c:	5b                   	pop    %ebx
 44d:	5e                   	pop    %esi
 44e:	5f                   	pop    %edi
 44f:	5d                   	pop    %ebp
 450:	c3                   	ret
 451:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 458:	31 c0                	xor    %eax,%eax
 45a:	eb 89                	jmp    3e5 <printint+0x25>
 45c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000460 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 460:	55                   	push   %ebp
 461:	89 e5                	mov    %esp,%ebp
 463:	57                   	push   %edi
 464:	56                   	push   %esi
 465:	53                   	push   %ebx
 466:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 469:	8b 75 0c             	mov    0xc(%ebp),%esi
{
 46c:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i = 0; fmt[i]; i++){
 46f:	0f b6 1e             	movzbl (%esi),%ebx
 472:	83 c6 01             	add    $0x1,%esi
 475:	84 db                	test   %bl,%bl
 477:	74 67                	je     4e0 <printf+0x80>
 479:	8d 4d 10             	lea    0x10(%ebp),%ecx
 47c:	31 d2                	xor    %edx,%edx
 47e:	89 4d d0             	mov    %ecx,-0x30(%ebp)
 481:	eb 34                	jmp    4b7 <printf+0x57>
 483:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 487:	90                   	nop
 488:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 48b:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 490:	83 f8 25             	cmp    $0x25,%eax
 493:	74 18                	je     4ad <printf+0x4d>
  write(fd, &c, 1);
 495:	83 ec 04             	sub    $0x4,%esp
 498:	8d 45 e7             	lea    -0x19(%ebp),%eax
 49b:	88 5d e7             	mov    %bl,-0x19(%ebp)
 49e:	6a 01                	push   $0x1
 4a0:	50                   	push   %eax
 4a1:	57                   	push   %edi
 4a2:	e8 5c fe ff ff       	call   303 <write>
 4a7:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 4aa:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 4ad:	0f b6 1e             	movzbl (%esi),%ebx
 4b0:	83 c6 01             	add    $0x1,%esi
 4b3:	84 db                	test   %bl,%bl
 4b5:	74 29                	je     4e0 <printf+0x80>
    c = fmt[i] & 0xff;
 4b7:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 4ba:	85 d2                	test   %edx,%edx
 4bc:	74 ca                	je     488 <printf+0x28>
      }
    } else if(state == '%'){
 4be:	83 fa 25             	cmp    $0x25,%edx
 4c1:	75 ea                	jne    4ad <printf+0x4d>
      if(c == 'd'){
 4c3:	83 f8 25             	cmp    $0x25,%eax
 4c6:	0f 84 24 01 00 00    	je     5f0 <printf+0x190>
 4cc:	83 e8 63             	sub    $0x63,%eax
 4cf:	83 f8 15             	cmp    $0x15,%eax
 4d2:	77 1c                	ja     4f0 <printf+0x90>
 4d4:	ff 24 85 2c 08 00 00 	jmp    *0x82c(,%eax,4)
 4db:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 4df:	90                   	nop
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 4e0:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4e3:	5b                   	pop    %ebx
 4e4:	5e                   	pop    %esi
 4e5:	5f                   	pop    %edi
 4e6:	5d                   	pop    %ebp
 4e7:	c3                   	ret
 4e8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4ef:	90                   	nop
  write(fd, &c, 1);
 4f0:	83 ec 04             	sub    $0x4,%esp
 4f3:	8d 55 e7             	lea    -0x19(%ebp),%edx
 4f6:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 4fa:	6a 01                	push   $0x1
 4fc:	52                   	push   %edx
 4fd:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 500:	57                   	push   %edi
 501:	e8 fd fd ff ff       	call   303 <write>
 506:	83 c4 0c             	add    $0xc,%esp
 509:	88 5d e7             	mov    %bl,-0x19(%ebp)
 50c:	6a 01                	push   $0x1
 50e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 511:	52                   	push   %edx
 512:	57                   	push   %edi
 513:	e8 eb fd ff ff       	call   303 <write>
        putc(fd, c);
 518:	83 c4 10             	add    $0x10,%esp
      state = 0;
 51b:	31 d2                	xor    %edx,%edx
 51d:	eb 8e                	jmp    4ad <printf+0x4d>
 51f:	90                   	nop
        printint(fd, *ap, 16, 0);
 520:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 523:	83 ec 0c             	sub    $0xc,%esp
 526:	b9 10 00 00 00       	mov    $0x10,%ecx
 52b:	8b 13                	mov    (%ebx),%edx
 52d:	6a 00                	push   $0x0
 52f:	89 f8                	mov    %edi,%eax
        ap++;
 531:	83 c3 04             	add    $0x4,%ebx
        printint(fd, *ap, 16, 0);
 534:	e8 87 fe ff ff       	call   3c0 <printint>
        ap++;
 539:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 53c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 53f:	31 d2                	xor    %edx,%edx
 541:	e9 67 ff ff ff       	jmp    4ad <printf+0x4d>
 546:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 54d:	8d 76 00             	lea    0x0(%esi),%esi
        s = (char*)*ap;
 550:	8b 45 d0             	mov    -0x30(%ebp),%eax
 553:	8b 18                	mov    (%eax),%ebx
        ap++;
 555:	83 c0 04             	add    $0x4,%eax
 558:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 55b:	85 db                	test   %ebx,%ebx
 55d:	0f 84 9d 00 00 00    	je     600 <printf+0x1a0>
        while(*s != 0){
 563:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 566:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 568:	84 c0                	test   %al,%al
 56a:	0f 84 3d ff ff ff    	je     4ad <printf+0x4d>
 570:	8d 55 e7             	lea    -0x19(%ebp),%edx
 573:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 576:	89 de                	mov    %ebx,%esi
 578:	89 d3                	mov    %edx,%ebx
 57a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 580:	83 ec 04             	sub    $0x4,%esp
 583:	88 45 e7             	mov    %al,-0x19(%ebp)
          s++;
 586:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 589:	6a 01                	push   $0x1
 58b:	53                   	push   %ebx
 58c:	57                   	push   %edi
 58d:	e8 71 fd ff ff       	call   303 <write>
        while(*s != 0){
 592:	0f b6 06             	movzbl (%esi),%eax
 595:	83 c4 10             	add    $0x10,%esp
 598:	84 c0                	test   %al,%al
 59a:	75 e4                	jne    580 <printf+0x120>
      state = 0;
 59c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
 59f:	31 d2                	xor    %edx,%edx
 5a1:	e9 07 ff ff ff       	jmp    4ad <printf+0x4d>
 5a6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5ad:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 5b0:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 5b3:	83 ec 0c             	sub    $0xc,%esp
 5b6:	b9 0a 00 00 00       	mov    $0xa,%ecx
 5bb:	8b 13                	mov    (%ebx),%edx
 5bd:	6a 01                	push   $0x1
 5bf:	e9 6b ff ff ff       	jmp    52f <printf+0xcf>
 5c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 5c8:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 5cb:	83 ec 04             	sub    $0x4,%esp
 5ce:	8d 55 e7             	lea    -0x19(%ebp),%edx
        putc(fd, *ap);
 5d1:	8b 03                	mov    (%ebx),%eax
        ap++;
 5d3:	83 c3 04             	add    $0x4,%ebx
        putc(fd, *ap);
 5d6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 5d9:	6a 01                	push   $0x1
 5db:	52                   	push   %edx
 5dc:	57                   	push   %edi
 5dd:	e8 21 fd ff ff       	call   303 <write>
        ap++;
 5e2:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 5e5:	83 c4 10             	add    $0x10,%esp
      state = 0;
 5e8:	31 d2                	xor    %edx,%edx
 5ea:	e9 be fe ff ff       	jmp    4ad <printf+0x4d>
 5ef:	90                   	nop
  write(fd, &c, 1);
 5f0:	83 ec 04             	sub    $0x4,%esp
 5f3:	88 5d e7             	mov    %bl,-0x19(%ebp)
 5f6:	8d 55 e7             	lea    -0x19(%ebp),%edx
 5f9:	6a 01                	push   $0x1
 5fb:	e9 11 ff ff ff       	jmp    511 <printf+0xb1>
 600:	b8 28 00 00 00       	mov    $0x28,%eax
          s = "(null)";
 605:	bb 25 08 00 00       	mov    $0x825,%ebx
 60a:	e9 61 ff ff ff       	jmp    570 <printf+0x110>
 60f:	90                   	nop

00000610 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 610:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 611:	a1 24 0b 00 00       	mov    0xb24,%eax
{
 616:	89 e5                	mov    %esp,%ebp
 618:	57                   	push   %edi
 619:	56                   	push   %esi
 61a:	53                   	push   %ebx
 61b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 61e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 621:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 628:	89 c2                	mov    %eax,%edx
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 62a:	8b 00                	mov    (%eax),%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 62c:	39 ca                	cmp    %ecx,%edx
 62e:	73 30                	jae    660 <free+0x50>
 630:	39 c1                	cmp    %eax,%ecx
 632:	72 04                	jb     638 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 634:	39 c2                	cmp    %eax,%edx
 636:	72 f0                	jb     628 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 638:	8b 73 fc             	mov    -0x4(%ebx),%esi
 63b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 63e:	39 f8                	cmp    %edi,%eax
 640:	74 2e                	je     670 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 642:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 645:	8b 42 04             	mov    0x4(%edx),%eax
 648:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 64b:	39 f1                	cmp    %esi,%ecx
 64d:	74 38                	je     687 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 64f:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 651:	5b                   	pop    %ebx
  freep = p;
 652:	89 15 24 0b 00 00    	mov    %edx,0xb24
}
 658:	5e                   	pop    %esi
 659:	5f                   	pop    %edi
 65a:	5d                   	pop    %ebp
 65b:	c3                   	ret
 65c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 660:	39 c1                	cmp    %eax,%ecx
 662:	72 d0                	jb     634 <free+0x24>
 664:	eb c2                	jmp    628 <free+0x18>
 666:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 66d:	8d 76 00             	lea    0x0(%esi),%esi
    bp->s.size += p->s.ptr->s.size;
 670:	03 70 04             	add    0x4(%eax),%esi
 673:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 676:	8b 02                	mov    (%edx),%eax
 678:	8b 00                	mov    (%eax),%eax
 67a:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 67d:	8b 42 04             	mov    0x4(%edx),%eax
 680:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 683:	39 f1                	cmp    %esi,%ecx
 685:	75 c8                	jne    64f <free+0x3f>
    p->s.size += bp->s.size;
 687:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 68a:	89 15 24 0b 00 00    	mov    %edx,0xb24
    p->s.size += bp->s.size;
 690:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 693:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 696:	89 0a                	mov    %ecx,(%edx)
}
 698:	5b                   	pop    %ebx
 699:	5e                   	pop    %esi
 69a:	5f                   	pop    %edi
 69b:	5d                   	pop    %ebp
 69c:	c3                   	ret
 69d:	8d 76 00             	lea    0x0(%esi),%esi

000006a0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 6a0:	55                   	push   %ebp
 6a1:	89 e5                	mov    %esp,%ebp
 6a3:	57                   	push   %edi
 6a4:	56                   	push   %esi
 6a5:	53                   	push   %ebx
 6a6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6a9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 6ac:	8b 15 24 0b 00 00    	mov    0xb24,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6b2:	8d 78 07             	lea    0x7(%eax),%edi
 6b5:	c1 ef 03             	shr    $0x3,%edi
 6b8:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 6bb:	85 d2                	test   %edx,%edx
 6bd:	0f 84 8d 00 00 00    	je     750 <malloc+0xb0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6c3:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 6c5:	8b 48 04             	mov    0x4(%eax),%ecx
 6c8:	39 f9                	cmp    %edi,%ecx
 6ca:	73 64                	jae    730 <malloc+0x90>
  if(nu < 4096)
 6cc:	bb 00 10 00 00       	mov    $0x1000,%ebx
 6d1:	39 df                	cmp    %ebx,%edi
 6d3:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 6d6:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 6dd:	eb 0a                	jmp    6e9 <malloc+0x49>
 6df:	90                   	nop
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6e0:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 6e2:	8b 48 04             	mov    0x4(%eax),%ecx
 6e5:	39 f9                	cmp    %edi,%ecx
 6e7:	73 47                	jae    730 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 6e9:	89 c2                	mov    %eax,%edx
 6eb:	39 05 24 0b 00 00    	cmp    %eax,0xb24
 6f1:	75 ed                	jne    6e0 <malloc+0x40>
  p = sbrk(nu * sizeof(Header));
 6f3:	83 ec 0c             	sub    $0xc,%esp
 6f6:	56                   	push   %esi
 6f7:	e8 6f fc ff ff       	call   36b <sbrk>
  if(p == (char*)-1)
 6fc:	83 c4 10             	add    $0x10,%esp
 6ff:	83 f8 ff             	cmp    $0xffffffff,%eax
 702:	74 1c                	je     720 <malloc+0x80>
  hp->s.size = nu;
 704:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 707:	83 ec 0c             	sub    $0xc,%esp
 70a:	83 c0 08             	add    $0x8,%eax
 70d:	50                   	push   %eax
 70e:	e8 fd fe ff ff       	call   610 <free>
  return freep;
 713:	8b 15 24 0b 00 00    	mov    0xb24,%edx
      if((p = morecore(nunits)) == 0)
 719:	83 c4 10             	add    $0x10,%esp
 71c:	85 d2                	test   %edx,%edx
 71e:	75 c0                	jne    6e0 <malloc+0x40>
        return 0;
  }
}
 720:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 723:	31 c0                	xor    %eax,%eax
}
 725:	5b                   	pop    %ebx
 726:	5e                   	pop    %esi
 727:	5f                   	pop    %edi
 728:	5d                   	pop    %ebp
 729:	c3                   	ret
 72a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 730:	39 cf                	cmp    %ecx,%edi
 732:	74 4c                	je     780 <malloc+0xe0>
        p->s.size -= nunits;
 734:	29 f9                	sub    %edi,%ecx
 736:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 739:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 73c:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 73f:	89 15 24 0b 00 00    	mov    %edx,0xb24
}
 745:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 748:	83 c0 08             	add    $0x8,%eax
}
 74b:	5b                   	pop    %ebx
 74c:	5e                   	pop    %esi
 74d:	5f                   	pop    %edi
 74e:	5d                   	pop    %ebp
 74f:	c3                   	ret
    base.s.ptr = freep = prevp = &base;
 750:	c7 05 24 0b 00 00 28 	movl   $0xb28,0xb24
 757:	0b 00 00 
    base.s.size = 0;
 75a:	b8 28 0b 00 00       	mov    $0xb28,%eax
    base.s.ptr = freep = prevp = &base;
 75f:	c7 05 28 0b 00 00 28 	movl   $0xb28,0xb28
 766:	0b 00 00 
    base.s.size = 0;
 769:	c7 05 2c 0b 00 00 00 	movl   $0x0,0xb2c
 770:	00 00 00 
    if(p->s.size >= nunits){
 773:	e9 54 ff ff ff       	jmp    6cc <malloc+0x2c>
 778:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 77f:	90                   	nop
        prevp->s.ptr = p->s.ptr;
 780:	8b 08                	mov    (%eax),%ecx
 782:	89 0a                	mov    %ecx,(%edx)
 784:	eb b9                	jmp    73f <malloc+0x9f>

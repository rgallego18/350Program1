
_shutdown2:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
    Failure to follow this instruction will lead to zero point 
	for this part */

int 
main(int argc, char * argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
	char msg[128] = {0};
   7:	31 c0                	xor    %eax,%eax
{
   9:	ff 71 fc             	push   -0x4(%ecx)
   c:	55                   	push   %ebp
   d:	89 e5                	mov    %esp,%ebp
   f:	57                   	push   %edi
  10:	56                   	push   %esi
	char msg[128] = {0};
  11:	8d bd 6c ff ff ff    	lea    -0x94(%ebp),%edi
{
  17:	53                   	push   %ebx
  18:	51                   	push   %ecx
  19:	81 ec 98 00 00 00    	sub    $0x98,%esp
  1f:	8b 11                	mov    (%ecx),%edx
  21:	8b 59 04             	mov    0x4(%ecx),%ebx
	char msg[128] = {0};
  24:	b9 1f 00 00 00       	mov    $0x1f,%ecx
  29:	f3 ab                	rep stos %eax,%es:(%edi)
  2b:	c7 85 68 ff ff ff 00 	movl   $0x0,-0x98(%ebp)
  32:	00 00 00 
{
  35:	89 95 64 ff ff ff    	mov    %edx,-0x9c(%ebp)
	char * p = msg;
	int i = 0;
	 
    for (i = 1; i < argc; i++) 
  3b:	83 fa 01             	cmp    $0x1,%edx
  3e:	7e 64                	jle    a4 <main+0xa4>
	char * p = msg;
  40:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
    for (i = 1; i < argc; i++) 
  46:	be 01 00 00 00       	mov    $0x1,%esi
	char * p = msg;
  4b:	89 85 60 ff ff ff    	mov    %eax,-0xa0(%ebp)
  51:	89 c7                	mov    %eax,%edi
  53:	eb 12                	jmp    67 <main+0x67>
  55:	8d 76 00             	lea    0x0(%esi),%esi
			p = msg + sizeof(msg);
			break;
		}
		else
		{
			*(p - 1) = ' ';
  58:	c6 47 ff 20          	movb   $0x20,-0x1(%edi)
    for (i = 1; i < argc; i++) 
  5c:	83 c6 01             	add    $0x1,%esi
  5f:	39 b5 64 ff ff ff    	cmp    %esi,-0x9c(%ebp)
  65:	74 26                	je     8d <main+0x8d>
	    strcpy(p, argv[i]);
  67:	83 ec 08             	sub    $0x8,%esp
  6a:	ff 34 b3             	push   (%ebx,%esi,4)
  6d:	57                   	push   %edi
  6e:	e8 4d 00 00 00       	call   c0 <strcpy>
		p += strlen(argv[i]) + 1;
  73:	58                   	pop    %eax
  74:	ff 34 b3             	push   (%ebx,%esi,4)
  77:	e8 d4 00 00 00       	call   150 <strlen>
		if (p >= msg + sizeof(msg))
  7c:	83 c4 10             	add    $0x10,%esp
		p += strlen(argv[i]) + 1;
  7f:	8d 7c 07 01          	lea    0x1(%edi,%eax,1),%edi
		if (p >= msg + sizeof(msg))
  83:	8d 45 e8             	lea    -0x18(%ebp),%eax
  86:	39 c7                	cmp    %eax,%edi
  88:	72 ce                	jb     58 <main+0x58>
			p = msg + sizeof(msg);
  8a:	8d 7d e8             	lea    -0x18(%ebp),%edi
	}
	
	*(p - 1) = 0;
	
	// "msg" now holds the shutdown message provided by the user
    shutdown2(msg);
  8d:	83 ec 0c             	sub    $0xc,%esp
	*(p - 1) = 0;
  90:	c6 47 ff 00          	movb   $0x0,-0x1(%edi)
    shutdown2(msg);
  94:	ff b5 60 ff ff ff    	push   -0xa0(%ebp)
  9a:	e8 0c 03 00 00       	call   3ab <shutdown2>
	
    exit(); //return 0;
  9f:	e8 5f 02 00 00       	call   303 <exit>
	char * p = msg;
  a4:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
  aa:	89 85 60 ff ff ff    	mov    %eax,-0xa0(%ebp)
  b0:	89 c7                	mov    %eax,%edi
  b2:	eb d9                	jmp    8d <main+0x8d>
  b4:	66 90                	xchg   %ax,%ax
  b6:	66 90                	xchg   %ax,%ax
  b8:	66 90                	xchg   %ax,%ax
  ba:	66 90                	xchg   %ax,%ax
  bc:	66 90                	xchg   %ax,%ax
  be:	66 90                	xchg   %ax,%ax

000000c0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  c0:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  c1:	31 c0                	xor    %eax,%eax
{
  c3:	89 e5                	mov    %esp,%ebp
  c5:	53                   	push   %ebx
  c6:	8b 4d 08             	mov    0x8(%ebp),%ecx
  c9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
  d0:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  d4:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  d7:	83 c0 01             	add    $0x1,%eax
  da:	84 d2                	test   %dl,%dl
  dc:	75 f2                	jne    d0 <strcpy+0x10>
    ;
  return os;
}
  de:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  e1:	89 c8                	mov    %ecx,%eax
  e3:	c9                   	leave
  e4:	c3                   	ret
  e5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000000f0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  f0:	55                   	push   %ebp
  f1:	89 e5                	mov    %esp,%ebp
  f3:	53                   	push   %ebx
  f4:	8b 55 08             	mov    0x8(%ebp),%edx
  f7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
  fa:	0f b6 02             	movzbl (%edx),%eax
  fd:	84 c0                	test   %al,%al
  ff:	75 17                	jne    118 <strcmp+0x28>
 101:	eb 3a                	jmp    13d <strcmp+0x4d>
 103:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 107:	90                   	nop
 108:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 10c:	83 c2 01             	add    $0x1,%edx
 10f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 112:	84 c0                	test   %al,%al
 114:	74 1a                	je     130 <strcmp+0x40>
    p++, q++;
 116:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
 118:	0f b6 19             	movzbl (%ecx),%ebx
 11b:	38 c3                	cmp    %al,%bl
 11d:	74 e9                	je     108 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 11f:	29 d8                	sub    %ebx,%eax
}
 121:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 124:	c9                   	leave
 125:	c3                   	ret
 126:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 12d:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
 130:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 134:	31 c0                	xor    %eax,%eax
 136:	29 d8                	sub    %ebx,%eax
}
 138:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 13b:	c9                   	leave
 13c:	c3                   	ret
  return (uchar)*p - (uchar)*q;
 13d:	0f b6 19             	movzbl (%ecx),%ebx
 140:	31 c0                	xor    %eax,%eax
 142:	eb db                	jmp    11f <strcmp+0x2f>
 144:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 14b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 14f:	90                   	nop

00000150 <strlen>:

uint
strlen(char *s)
{
 150:	55                   	push   %ebp
 151:	89 e5                	mov    %esp,%ebp
 153:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 156:	80 3a 00             	cmpb   $0x0,(%edx)
 159:	74 15                	je     170 <strlen+0x20>
 15b:	31 c0                	xor    %eax,%eax
 15d:	8d 76 00             	lea    0x0(%esi),%esi
 160:	83 c0 01             	add    $0x1,%eax
 163:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 167:	89 c1                	mov    %eax,%ecx
 169:	75 f5                	jne    160 <strlen+0x10>
    ;
  return n;
}
 16b:	89 c8                	mov    %ecx,%eax
 16d:	5d                   	pop    %ebp
 16e:	c3                   	ret
 16f:	90                   	nop
  for(n = 0; s[n]; n++)
 170:	31 c9                	xor    %ecx,%ecx
}
 172:	5d                   	pop    %ebp
 173:	89 c8                	mov    %ecx,%eax
 175:	c3                   	ret
 176:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 17d:	8d 76 00             	lea    0x0(%esi),%esi

00000180 <memset>:

void*
memset(void *dst, int c, uint n)
{
 180:	55                   	push   %ebp
 181:	89 e5                	mov    %esp,%ebp
 183:	57                   	push   %edi
 184:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 187:	8b 4d 10             	mov    0x10(%ebp),%ecx
 18a:	8b 45 0c             	mov    0xc(%ebp),%eax
 18d:	89 d7                	mov    %edx,%edi
 18f:	fc                   	cld
 190:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 192:	8b 7d fc             	mov    -0x4(%ebp),%edi
 195:	89 d0                	mov    %edx,%eax
 197:	c9                   	leave
 198:	c3                   	ret
 199:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000001a0 <strchr>:

char*
strchr(const char *s, char c)
{
 1a0:	55                   	push   %ebp
 1a1:	89 e5                	mov    %esp,%ebp
 1a3:	8b 45 08             	mov    0x8(%ebp),%eax
 1a6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 1aa:	0f b6 10             	movzbl (%eax),%edx
 1ad:	84 d2                	test   %dl,%dl
 1af:	75 12                	jne    1c3 <strchr+0x23>
 1b1:	eb 1d                	jmp    1d0 <strchr+0x30>
 1b3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1b7:	90                   	nop
 1b8:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 1bc:	83 c0 01             	add    $0x1,%eax
 1bf:	84 d2                	test   %dl,%dl
 1c1:	74 0d                	je     1d0 <strchr+0x30>
    if(*s == c)
 1c3:	38 d1                	cmp    %dl,%cl
 1c5:	75 f1                	jne    1b8 <strchr+0x18>
      return (char*)s;
  return 0;
}
 1c7:	5d                   	pop    %ebp
 1c8:	c3                   	ret
 1c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 1d0:	31 c0                	xor    %eax,%eax
}
 1d2:	5d                   	pop    %ebp
 1d3:	c3                   	ret
 1d4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1db:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1df:	90                   	nop

000001e0 <gets>:

char*
gets(char *buf, int max)
{
 1e0:	55                   	push   %ebp
 1e1:	89 e5                	mov    %esp,%ebp
 1e3:	57                   	push   %edi
 1e4:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 1e5:	8d 75 e7             	lea    -0x19(%ebp),%esi
{
 1e8:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 1e9:	31 db                	xor    %ebx,%ebx
{
 1eb:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 1ee:	eb 27                	jmp    217 <gets+0x37>
    cc = read(0, &c, 1);
 1f0:	83 ec 04             	sub    $0x4,%esp
 1f3:	6a 01                	push   $0x1
 1f5:	56                   	push   %esi
 1f6:	6a 00                	push   $0x0
 1f8:	e8 1e 01 00 00       	call   31b <read>
    if(cc < 1)
 1fd:	83 c4 10             	add    $0x10,%esp
 200:	85 c0                	test   %eax,%eax
 202:	7e 1d                	jle    221 <gets+0x41>
      break;
    buf[i++] = c;
 204:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 208:	8b 55 08             	mov    0x8(%ebp),%edx
 20b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 20f:	3c 0a                	cmp    $0xa,%al
 211:	74 10                	je     223 <gets+0x43>
 213:	3c 0d                	cmp    $0xd,%al
 215:	74 0c                	je     223 <gets+0x43>
  for(i=0; i+1 < max; ){
 217:	89 df                	mov    %ebx,%edi
 219:	83 c3 01             	add    $0x1,%ebx
 21c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 21f:	7c cf                	jl     1f0 <gets+0x10>
 221:	89 fb                	mov    %edi,%ebx
      break;
  }
  buf[i] = '\0';
 223:	8b 45 08             	mov    0x8(%ebp),%eax
 226:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
  return buf;
}
 22a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 22d:	5b                   	pop    %ebx
 22e:	5e                   	pop    %esi
 22f:	5f                   	pop    %edi
 230:	5d                   	pop    %ebp
 231:	c3                   	ret
 232:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 239:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000240 <stat>:

int
stat(char *n, struct stat *st)
{
 240:	55                   	push   %ebp
 241:	89 e5                	mov    %esp,%ebp
 243:	56                   	push   %esi
 244:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 245:	83 ec 08             	sub    $0x8,%esp
 248:	6a 00                	push   $0x0
 24a:	ff 75 08             	push   0x8(%ebp)
 24d:	e8 f1 00 00 00       	call   343 <open>
  if(fd < 0)
 252:	83 c4 10             	add    $0x10,%esp
 255:	85 c0                	test   %eax,%eax
 257:	78 27                	js     280 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 259:	83 ec 08             	sub    $0x8,%esp
 25c:	ff 75 0c             	push   0xc(%ebp)
 25f:	89 c3                	mov    %eax,%ebx
 261:	50                   	push   %eax
 262:	e8 f4 00 00 00       	call   35b <fstat>
  close(fd);
 267:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 26a:	89 c6                	mov    %eax,%esi
  close(fd);
 26c:	e8 ba 00 00 00       	call   32b <close>
  return r;
 271:	83 c4 10             	add    $0x10,%esp
}
 274:	8d 65 f8             	lea    -0x8(%ebp),%esp
 277:	89 f0                	mov    %esi,%eax
 279:	5b                   	pop    %ebx
 27a:	5e                   	pop    %esi
 27b:	5d                   	pop    %ebp
 27c:	c3                   	ret
 27d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 280:	be ff ff ff ff       	mov    $0xffffffff,%esi
 285:	eb ed                	jmp    274 <stat+0x34>
 287:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 28e:	66 90                	xchg   %ax,%ax

00000290 <atoi>:

int
atoi(const char *s)
{
 290:	55                   	push   %ebp
 291:	89 e5                	mov    %esp,%ebp
 293:	53                   	push   %ebx
 294:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 297:	0f be 02             	movsbl (%edx),%eax
 29a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 29d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 2a0:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 2a5:	77 1e                	ja     2c5 <atoi+0x35>
 2a7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2ae:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 2b0:	83 c2 01             	add    $0x1,%edx
 2b3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 2b6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 2ba:	0f be 02             	movsbl (%edx),%eax
 2bd:	8d 58 d0             	lea    -0x30(%eax),%ebx
 2c0:	80 fb 09             	cmp    $0x9,%bl
 2c3:	76 eb                	jbe    2b0 <atoi+0x20>
  return n;
}
 2c5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2c8:	89 c8                	mov    %ecx,%eax
 2ca:	c9                   	leave
 2cb:	c3                   	ret
 2cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000002d0 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 2d0:	55                   	push   %ebp
 2d1:	89 e5                	mov    %esp,%ebp
 2d3:	57                   	push   %edi
 2d4:	56                   	push   %esi
 2d5:	8b 45 10             	mov    0x10(%ebp),%eax
 2d8:	8b 55 08             	mov    0x8(%ebp),%edx
 2db:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2de:	85 c0                	test   %eax,%eax
 2e0:	7e 13                	jle    2f5 <memmove+0x25>
 2e2:	01 d0                	add    %edx,%eax
  dst = vdst;
 2e4:	89 d7                	mov    %edx,%edi
 2e6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2ed:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 2f0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 2f1:	39 f8                	cmp    %edi,%eax
 2f3:	75 fb                	jne    2f0 <memmove+0x20>
  return vdst;
}
 2f5:	5e                   	pop    %esi
 2f6:	89 d0                	mov    %edx,%eax
 2f8:	5f                   	pop    %edi
 2f9:	5d                   	pop    %ebp
 2fa:	c3                   	ret

000002fb <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2fb:	b8 01 00 00 00       	mov    $0x1,%eax
 300:	cd 40                	int    $0x40
 302:	c3                   	ret

00000303 <exit>:
SYSCALL(exit)
 303:	b8 02 00 00 00       	mov    $0x2,%eax
 308:	cd 40                	int    $0x40
 30a:	c3                   	ret

0000030b <wait>:
SYSCALL(wait)
 30b:	b8 03 00 00 00       	mov    $0x3,%eax
 310:	cd 40                	int    $0x40
 312:	c3                   	ret

00000313 <pipe>:
SYSCALL(pipe)
 313:	b8 04 00 00 00       	mov    $0x4,%eax
 318:	cd 40                	int    $0x40
 31a:	c3                   	ret

0000031b <read>:
SYSCALL(read)
 31b:	b8 05 00 00 00       	mov    $0x5,%eax
 320:	cd 40                	int    $0x40
 322:	c3                   	ret

00000323 <write>:
SYSCALL(write)
 323:	b8 10 00 00 00       	mov    $0x10,%eax
 328:	cd 40                	int    $0x40
 32a:	c3                   	ret

0000032b <close>:
SYSCALL(close)
 32b:	b8 15 00 00 00       	mov    $0x15,%eax
 330:	cd 40                	int    $0x40
 332:	c3                   	ret

00000333 <kill>:
SYSCALL(kill)
 333:	b8 06 00 00 00       	mov    $0x6,%eax
 338:	cd 40                	int    $0x40
 33a:	c3                   	ret

0000033b <exec>:
SYSCALL(exec)
 33b:	b8 07 00 00 00       	mov    $0x7,%eax
 340:	cd 40                	int    $0x40
 342:	c3                   	ret

00000343 <open>:
SYSCALL(open)
 343:	b8 0f 00 00 00       	mov    $0xf,%eax
 348:	cd 40                	int    $0x40
 34a:	c3                   	ret

0000034b <mknod>:
SYSCALL(mknod)
 34b:	b8 11 00 00 00       	mov    $0x11,%eax
 350:	cd 40                	int    $0x40
 352:	c3                   	ret

00000353 <unlink>:
SYSCALL(unlink)
 353:	b8 12 00 00 00       	mov    $0x12,%eax
 358:	cd 40                	int    $0x40
 35a:	c3                   	ret

0000035b <fstat>:
SYSCALL(fstat)
 35b:	b8 08 00 00 00       	mov    $0x8,%eax
 360:	cd 40                	int    $0x40
 362:	c3                   	ret

00000363 <link>:
SYSCALL(link)
 363:	b8 13 00 00 00       	mov    $0x13,%eax
 368:	cd 40                	int    $0x40
 36a:	c3                   	ret

0000036b <mkdir>:
SYSCALL(mkdir)
 36b:	b8 14 00 00 00       	mov    $0x14,%eax
 370:	cd 40                	int    $0x40
 372:	c3                   	ret

00000373 <chdir>:
SYSCALL(chdir)
 373:	b8 09 00 00 00       	mov    $0x9,%eax
 378:	cd 40                	int    $0x40
 37a:	c3                   	ret

0000037b <dup>:
SYSCALL(dup)
 37b:	b8 0a 00 00 00       	mov    $0xa,%eax
 380:	cd 40                	int    $0x40
 382:	c3                   	ret

00000383 <getpid>:
SYSCALL(getpid)
 383:	b8 0b 00 00 00       	mov    $0xb,%eax
 388:	cd 40                	int    $0x40
 38a:	c3                   	ret

0000038b <sbrk>:
SYSCALL(sbrk)
 38b:	b8 0c 00 00 00       	mov    $0xc,%eax
 390:	cd 40                	int    $0x40
 392:	c3                   	ret

00000393 <sleep>:
SYSCALL(sleep)
 393:	b8 0d 00 00 00       	mov    $0xd,%eax
 398:	cd 40                	int    $0x40
 39a:	c3                   	ret

0000039b <uptime>:
SYSCALL(uptime)
 39b:	b8 0e 00 00 00       	mov    $0xe,%eax
 3a0:	cd 40                	int    $0x40
 3a2:	c3                   	ret

000003a3 <shutdown>:
SYSCALL(shutdown)
 3a3:	b8 16 00 00 00       	mov    $0x16,%eax
 3a8:	cd 40                	int    $0x40
 3aa:	c3                   	ret

000003ab <shutdown2>:
SYSCALL(shutdown2)
 3ab:	b8 17 00 00 00       	mov    $0x17,%eax
 3b0:	cd 40                	int    $0x40
 3b2:	c3                   	ret

000003b3 <exit2>:
SYSCALL(exit2)
 3b3:	b8 18 00 00 00       	mov    $0x18,%eax
 3b8:	cd 40                	int    $0x40
 3ba:	c3                   	ret

000003bb <uptime2>:
SYSCALL(uptime2)
 3bb:	b8 19 00 00 00       	mov    $0x19,%eax
 3c0:	cd 40                	int    $0x40
 3c2:	c3                   	ret

000003c3 <mkdir2>:
SYSCALL(mkdir2)
 3c3:	b8 1a 00 00 00       	mov    $0x1a,%eax
 3c8:	cd 40                	int    $0x40
 3ca:	c3                   	ret
 3cb:	66 90                	xchg   %ax,%ax
 3cd:	66 90                	xchg   %ax,%ax
 3cf:	90                   	nop

000003d0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 3d0:	55                   	push   %ebp
 3d1:	89 e5                	mov    %esp,%ebp
 3d3:	57                   	push   %edi
 3d4:	56                   	push   %esi
 3d5:	53                   	push   %ebx
 3d6:	89 cb                	mov    %ecx,%ebx
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 3d8:	89 d1                	mov    %edx,%ecx
{
 3da:	83 ec 3c             	sub    $0x3c,%esp
 3dd:	89 45 c0             	mov    %eax,-0x40(%ebp)
  if(sgn && xx < 0){
 3e0:	85 d2                	test   %edx,%edx
 3e2:	0f 89 80 00 00 00    	jns    468 <printint+0x98>
 3e8:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 3ec:	74 7a                	je     468 <printint+0x98>
    x = -xx;
 3ee:	f7 d9                	neg    %ecx
    neg = 1;
 3f0:	b8 01 00 00 00       	mov    $0x1,%eax
  } else {
    x = xx;
  }

  i = 0;
 3f5:	89 45 c4             	mov    %eax,-0x3c(%ebp)
 3f8:	31 f6                	xor    %esi,%esi
 3fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 400:	89 c8                	mov    %ecx,%eax
 402:	31 d2                	xor    %edx,%edx
 404:	89 f7                	mov    %esi,%edi
 406:	f7 f3                	div    %ebx
 408:	8d 76 01             	lea    0x1(%esi),%esi
 40b:	0f b6 92 f8 07 00 00 	movzbl 0x7f8(%edx),%edx
 412:	88 54 35 d7          	mov    %dl,-0x29(%ebp,%esi,1)
  }while((x /= base) != 0);
 416:	89 ca                	mov    %ecx,%edx
 418:	89 c1                	mov    %eax,%ecx
 41a:	39 da                	cmp    %ebx,%edx
 41c:	73 e2                	jae    400 <printint+0x30>
  if(neg)
 41e:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 421:	85 c0                	test   %eax,%eax
 423:	74 07                	je     42c <printint+0x5c>
    buf[i++] = '-';
 425:	c6 44 35 d8 2d       	movb   $0x2d,-0x28(%ebp,%esi,1)
    buf[i++] = digits[x % base];
 42a:	89 f7                	mov    %esi,%edi
 42c:	8d 5d d8             	lea    -0x28(%ebp),%ebx
 42f:	8b 75 c0             	mov    -0x40(%ebp),%esi
 432:	01 df                	add    %ebx,%edi
 434:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  while(--i >= 0)
    putc(fd, buf[i]);
 438:	0f b6 07             	movzbl (%edi),%eax
  write(fd, &c, 1);
 43b:	83 ec 04             	sub    $0x4,%esp
 43e:	88 45 d7             	mov    %al,-0x29(%ebp)
 441:	8d 45 d7             	lea    -0x29(%ebp),%eax
 444:	6a 01                	push   $0x1
 446:	50                   	push   %eax
 447:	56                   	push   %esi
 448:	e8 d6 fe ff ff       	call   323 <write>
  while(--i >= 0)
 44d:	89 f8                	mov    %edi,%eax
 44f:	83 c4 10             	add    $0x10,%esp
 452:	83 ef 01             	sub    $0x1,%edi
 455:	39 d8                	cmp    %ebx,%eax
 457:	75 df                	jne    438 <printint+0x68>
}
 459:	8d 65 f4             	lea    -0xc(%ebp),%esp
 45c:	5b                   	pop    %ebx
 45d:	5e                   	pop    %esi
 45e:	5f                   	pop    %edi
 45f:	5d                   	pop    %ebp
 460:	c3                   	ret
 461:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 468:	31 c0                	xor    %eax,%eax
 46a:	eb 89                	jmp    3f5 <printint+0x25>
 46c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000470 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 470:	55                   	push   %ebp
 471:	89 e5                	mov    %esp,%ebp
 473:	57                   	push   %edi
 474:	56                   	push   %esi
 475:	53                   	push   %ebx
 476:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 479:	8b 75 0c             	mov    0xc(%ebp),%esi
{
 47c:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i = 0; fmt[i]; i++){
 47f:	0f b6 1e             	movzbl (%esi),%ebx
 482:	83 c6 01             	add    $0x1,%esi
 485:	84 db                	test   %bl,%bl
 487:	74 67                	je     4f0 <printf+0x80>
 489:	8d 4d 10             	lea    0x10(%ebp),%ecx
 48c:	31 d2                	xor    %edx,%edx
 48e:	89 4d d0             	mov    %ecx,-0x30(%ebp)
 491:	eb 34                	jmp    4c7 <printf+0x57>
 493:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 497:	90                   	nop
 498:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 49b:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 4a0:	83 f8 25             	cmp    $0x25,%eax
 4a3:	74 18                	je     4bd <printf+0x4d>
  write(fd, &c, 1);
 4a5:	83 ec 04             	sub    $0x4,%esp
 4a8:	8d 45 e7             	lea    -0x19(%ebp),%eax
 4ab:	88 5d e7             	mov    %bl,-0x19(%ebp)
 4ae:	6a 01                	push   $0x1
 4b0:	50                   	push   %eax
 4b1:	57                   	push   %edi
 4b2:	e8 6c fe ff ff       	call   323 <write>
 4b7:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 4ba:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 4bd:	0f b6 1e             	movzbl (%esi),%ebx
 4c0:	83 c6 01             	add    $0x1,%esi
 4c3:	84 db                	test   %bl,%bl
 4c5:	74 29                	je     4f0 <printf+0x80>
    c = fmt[i] & 0xff;
 4c7:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 4ca:	85 d2                	test   %edx,%edx
 4cc:	74 ca                	je     498 <printf+0x28>
      }
    } else if(state == '%'){
 4ce:	83 fa 25             	cmp    $0x25,%edx
 4d1:	75 ea                	jne    4bd <printf+0x4d>
      if(c == 'd'){
 4d3:	83 f8 25             	cmp    $0x25,%eax
 4d6:	0f 84 24 01 00 00    	je     600 <printf+0x190>
 4dc:	83 e8 63             	sub    $0x63,%eax
 4df:	83 f8 15             	cmp    $0x15,%eax
 4e2:	77 1c                	ja     500 <printf+0x90>
 4e4:	ff 24 85 a0 07 00 00 	jmp    *0x7a0(,%eax,4)
 4eb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 4ef:	90                   	nop
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 4f0:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4f3:	5b                   	pop    %ebx
 4f4:	5e                   	pop    %esi
 4f5:	5f                   	pop    %edi
 4f6:	5d                   	pop    %ebp
 4f7:	c3                   	ret
 4f8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4ff:	90                   	nop
  write(fd, &c, 1);
 500:	83 ec 04             	sub    $0x4,%esp
 503:	8d 55 e7             	lea    -0x19(%ebp),%edx
 506:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 50a:	6a 01                	push   $0x1
 50c:	52                   	push   %edx
 50d:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 510:	57                   	push   %edi
 511:	e8 0d fe ff ff       	call   323 <write>
 516:	83 c4 0c             	add    $0xc,%esp
 519:	88 5d e7             	mov    %bl,-0x19(%ebp)
 51c:	6a 01                	push   $0x1
 51e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 521:	52                   	push   %edx
 522:	57                   	push   %edi
 523:	e8 fb fd ff ff       	call   323 <write>
        putc(fd, c);
 528:	83 c4 10             	add    $0x10,%esp
      state = 0;
 52b:	31 d2                	xor    %edx,%edx
 52d:	eb 8e                	jmp    4bd <printf+0x4d>
 52f:	90                   	nop
        printint(fd, *ap, 16, 0);
 530:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 533:	83 ec 0c             	sub    $0xc,%esp
 536:	b9 10 00 00 00       	mov    $0x10,%ecx
 53b:	8b 13                	mov    (%ebx),%edx
 53d:	6a 00                	push   $0x0
 53f:	89 f8                	mov    %edi,%eax
        ap++;
 541:	83 c3 04             	add    $0x4,%ebx
        printint(fd, *ap, 16, 0);
 544:	e8 87 fe ff ff       	call   3d0 <printint>
        ap++;
 549:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 54c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 54f:	31 d2                	xor    %edx,%edx
 551:	e9 67 ff ff ff       	jmp    4bd <printf+0x4d>
 556:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 55d:	8d 76 00             	lea    0x0(%esi),%esi
        s = (char*)*ap;
 560:	8b 45 d0             	mov    -0x30(%ebp),%eax
 563:	8b 18                	mov    (%eax),%ebx
        ap++;
 565:	83 c0 04             	add    $0x4,%eax
 568:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 56b:	85 db                	test   %ebx,%ebx
 56d:	0f 84 9d 00 00 00    	je     610 <printf+0x1a0>
        while(*s != 0){
 573:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 576:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 578:	84 c0                	test   %al,%al
 57a:	0f 84 3d ff ff ff    	je     4bd <printf+0x4d>
 580:	8d 55 e7             	lea    -0x19(%ebp),%edx
 583:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 586:	89 de                	mov    %ebx,%esi
 588:	89 d3                	mov    %edx,%ebx
 58a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 590:	83 ec 04             	sub    $0x4,%esp
 593:	88 45 e7             	mov    %al,-0x19(%ebp)
          s++;
 596:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 599:	6a 01                	push   $0x1
 59b:	53                   	push   %ebx
 59c:	57                   	push   %edi
 59d:	e8 81 fd ff ff       	call   323 <write>
        while(*s != 0){
 5a2:	0f b6 06             	movzbl (%esi),%eax
 5a5:	83 c4 10             	add    $0x10,%esp
 5a8:	84 c0                	test   %al,%al
 5aa:	75 e4                	jne    590 <printf+0x120>
      state = 0;
 5ac:	8b 75 d4             	mov    -0x2c(%ebp),%esi
 5af:	31 d2                	xor    %edx,%edx
 5b1:	e9 07 ff ff ff       	jmp    4bd <printf+0x4d>
 5b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5bd:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 5c0:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 5c3:	83 ec 0c             	sub    $0xc,%esp
 5c6:	b9 0a 00 00 00       	mov    $0xa,%ecx
 5cb:	8b 13                	mov    (%ebx),%edx
 5cd:	6a 01                	push   $0x1
 5cf:	e9 6b ff ff ff       	jmp    53f <printf+0xcf>
 5d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 5d8:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 5db:	83 ec 04             	sub    $0x4,%esp
 5de:	8d 55 e7             	lea    -0x19(%ebp),%edx
        putc(fd, *ap);
 5e1:	8b 03                	mov    (%ebx),%eax
        ap++;
 5e3:	83 c3 04             	add    $0x4,%ebx
        putc(fd, *ap);
 5e6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 5e9:	6a 01                	push   $0x1
 5eb:	52                   	push   %edx
 5ec:	57                   	push   %edi
 5ed:	e8 31 fd ff ff       	call   323 <write>
        ap++;
 5f2:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 5f5:	83 c4 10             	add    $0x10,%esp
      state = 0;
 5f8:	31 d2                	xor    %edx,%edx
 5fa:	e9 be fe ff ff       	jmp    4bd <printf+0x4d>
 5ff:	90                   	nop
  write(fd, &c, 1);
 600:	83 ec 04             	sub    $0x4,%esp
 603:	88 5d e7             	mov    %bl,-0x19(%ebp)
 606:	8d 55 e7             	lea    -0x19(%ebp),%edx
 609:	6a 01                	push   $0x1
 60b:	e9 11 ff ff ff       	jmp    521 <printf+0xb1>
 610:	b8 28 00 00 00       	mov    $0x28,%eax
          s = "(null)";
 615:	bb 98 07 00 00       	mov    $0x798,%ebx
 61a:	e9 61 ff ff ff       	jmp    580 <printf+0x110>
 61f:	90                   	nop

00000620 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 620:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 621:	a1 a4 0a 00 00       	mov    0xaa4,%eax
{
 626:	89 e5                	mov    %esp,%ebp
 628:	57                   	push   %edi
 629:	56                   	push   %esi
 62a:	53                   	push   %ebx
 62b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 62e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 631:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 638:	89 c2                	mov    %eax,%edx
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 63a:	8b 00                	mov    (%eax),%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 63c:	39 ca                	cmp    %ecx,%edx
 63e:	73 30                	jae    670 <free+0x50>
 640:	39 c1                	cmp    %eax,%ecx
 642:	72 04                	jb     648 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 644:	39 c2                	cmp    %eax,%edx
 646:	72 f0                	jb     638 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 648:	8b 73 fc             	mov    -0x4(%ebx),%esi
 64b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 64e:	39 f8                	cmp    %edi,%eax
 650:	74 2e                	je     680 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 652:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 655:	8b 42 04             	mov    0x4(%edx),%eax
 658:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 65b:	39 f1                	cmp    %esi,%ecx
 65d:	74 38                	je     697 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 65f:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 661:	5b                   	pop    %ebx
  freep = p;
 662:	89 15 a4 0a 00 00    	mov    %edx,0xaa4
}
 668:	5e                   	pop    %esi
 669:	5f                   	pop    %edi
 66a:	5d                   	pop    %ebp
 66b:	c3                   	ret
 66c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 670:	39 c1                	cmp    %eax,%ecx
 672:	72 d0                	jb     644 <free+0x24>
 674:	eb c2                	jmp    638 <free+0x18>
 676:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 67d:	8d 76 00             	lea    0x0(%esi),%esi
    bp->s.size += p->s.ptr->s.size;
 680:	03 70 04             	add    0x4(%eax),%esi
 683:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 686:	8b 02                	mov    (%edx),%eax
 688:	8b 00                	mov    (%eax),%eax
 68a:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 68d:	8b 42 04             	mov    0x4(%edx),%eax
 690:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 693:	39 f1                	cmp    %esi,%ecx
 695:	75 c8                	jne    65f <free+0x3f>
    p->s.size += bp->s.size;
 697:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 69a:	89 15 a4 0a 00 00    	mov    %edx,0xaa4
    p->s.size += bp->s.size;
 6a0:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 6a3:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 6a6:	89 0a                	mov    %ecx,(%edx)
}
 6a8:	5b                   	pop    %ebx
 6a9:	5e                   	pop    %esi
 6aa:	5f                   	pop    %edi
 6ab:	5d                   	pop    %ebp
 6ac:	c3                   	ret
 6ad:	8d 76 00             	lea    0x0(%esi),%esi

000006b0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 6b0:	55                   	push   %ebp
 6b1:	89 e5                	mov    %esp,%ebp
 6b3:	57                   	push   %edi
 6b4:	56                   	push   %esi
 6b5:	53                   	push   %ebx
 6b6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6b9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 6bc:	8b 15 a4 0a 00 00    	mov    0xaa4,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6c2:	8d 78 07             	lea    0x7(%eax),%edi
 6c5:	c1 ef 03             	shr    $0x3,%edi
 6c8:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 6cb:	85 d2                	test   %edx,%edx
 6cd:	0f 84 8d 00 00 00    	je     760 <malloc+0xb0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6d3:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 6d5:	8b 48 04             	mov    0x4(%eax),%ecx
 6d8:	39 f9                	cmp    %edi,%ecx
 6da:	73 64                	jae    740 <malloc+0x90>
  if(nu < 4096)
 6dc:	bb 00 10 00 00       	mov    $0x1000,%ebx
 6e1:	39 df                	cmp    %ebx,%edi
 6e3:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 6e6:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 6ed:	eb 0a                	jmp    6f9 <malloc+0x49>
 6ef:	90                   	nop
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6f0:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 6f2:	8b 48 04             	mov    0x4(%eax),%ecx
 6f5:	39 f9                	cmp    %edi,%ecx
 6f7:	73 47                	jae    740 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 6f9:	89 c2                	mov    %eax,%edx
 6fb:	39 05 a4 0a 00 00    	cmp    %eax,0xaa4
 701:	75 ed                	jne    6f0 <malloc+0x40>
  p = sbrk(nu * sizeof(Header));
 703:	83 ec 0c             	sub    $0xc,%esp
 706:	56                   	push   %esi
 707:	e8 7f fc ff ff       	call   38b <sbrk>
  if(p == (char*)-1)
 70c:	83 c4 10             	add    $0x10,%esp
 70f:	83 f8 ff             	cmp    $0xffffffff,%eax
 712:	74 1c                	je     730 <malloc+0x80>
  hp->s.size = nu;
 714:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 717:	83 ec 0c             	sub    $0xc,%esp
 71a:	83 c0 08             	add    $0x8,%eax
 71d:	50                   	push   %eax
 71e:	e8 fd fe ff ff       	call   620 <free>
  return freep;
 723:	8b 15 a4 0a 00 00    	mov    0xaa4,%edx
      if((p = morecore(nunits)) == 0)
 729:	83 c4 10             	add    $0x10,%esp
 72c:	85 d2                	test   %edx,%edx
 72e:	75 c0                	jne    6f0 <malloc+0x40>
        return 0;
  }
}
 730:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 733:	31 c0                	xor    %eax,%eax
}
 735:	5b                   	pop    %ebx
 736:	5e                   	pop    %esi
 737:	5f                   	pop    %edi
 738:	5d                   	pop    %ebp
 739:	c3                   	ret
 73a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 740:	39 cf                	cmp    %ecx,%edi
 742:	74 4c                	je     790 <malloc+0xe0>
        p->s.size -= nunits;
 744:	29 f9                	sub    %edi,%ecx
 746:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 749:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 74c:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 74f:	89 15 a4 0a 00 00    	mov    %edx,0xaa4
}
 755:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 758:	83 c0 08             	add    $0x8,%eax
}
 75b:	5b                   	pop    %ebx
 75c:	5e                   	pop    %esi
 75d:	5f                   	pop    %edi
 75e:	5d                   	pop    %ebp
 75f:	c3                   	ret
    base.s.ptr = freep = prevp = &base;
 760:	c7 05 a4 0a 00 00 a8 	movl   $0xaa8,0xaa4
 767:	0a 00 00 
    base.s.size = 0;
 76a:	b8 a8 0a 00 00       	mov    $0xaa8,%eax
    base.s.ptr = freep = prevp = &base;
 76f:	c7 05 a8 0a 00 00 a8 	movl   $0xaa8,0xaa8
 776:	0a 00 00 
    base.s.size = 0;
 779:	c7 05 ac 0a 00 00 00 	movl   $0x0,0xaac
 780:	00 00 00 
    if(p->s.size >= nunits){
 783:	e9 54 ff ff ff       	jmp    6dc <malloc+0x2c>
 788:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 78f:	90                   	nop
        prevp->s.ptr = p->s.ptr;
 790:	8b 08                	mov    (%eax),%ecx
 792:	89 0a                	mov    %ecx,(%edx)
 794:	eb b9                	jmp    74f <malloc+0x9f>

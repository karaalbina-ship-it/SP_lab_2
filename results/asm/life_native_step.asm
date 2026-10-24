0000000000001dc0 <step>:
    1dc0:	endbr64
    1dc4:	push   rbp
    1dc5:	mov    rbp,rsp
    1dc8:	push   r15
    1dca:	push   r14
    1dcc:	push   r13
    1dce:	push   r12
    1dd0:	push   rbx
    1dd1:	and    rsp,0xffffffffffffffc0
    1dd5:	sub    rsp,0x8
    1dd9:	mov    r15d,DWORD PTR [rdi]
    1ddc:	movsxd r8,DWORD PTR [rdi+0x4]
    1de0:	mov    r9,QWORD PTR [rdi+0x8]
    1de4:	mov    r11,QWORD PTR [rsi+0x8]
    1de8:	mov    DWORD PTR [rsp-0x34],r15d
    1ded:	test   r15d,r15d
    1df0:	jle    2186 <step+0x3c6>
    1df6:	lea    eax,[r15-0x1]
    1dfa:	mov    ebx,r8d
    1dfd:	mov    r14d,r15d
    1e00:	lea    rdi,[r8+r8*1]
    1e04:	mov    DWORD PTR [rsp-0x8],eax
    1e08:	lea    rax,[r8+rax*1+0x1]
    1e0d:	neg    ebx
    1e0f:	and    r14d,0xffffffc0
    1e13:	mov    QWORD PTR [rsp-0x18],rax
    1e18:	lea    eax,[r15+0x1]
    1e1c:	movsxd rbx,ebx
    1e1f:	lea    rcx,[r9+rdi*1]
    1e23:	vmovd  xmm5,eax
    1e27:	mov    eax,r15d
    1e2a:	lea    r13,[r9+rbx*1]
    1e2e:	lea    rdx,[rbx+r8*1]
    1e32:	shr    eax,0x6
    1e35:	mov    DWORD PTR [rsp-0x38],r14d
    1e3a:	mov    DWORD PTR [rsp-0x4],0x1
    1e42:	vmovdqa32 xmm16,xmm5
    1e48:	mov    ebx,0x3
    1e4d:	sub    r15d,r14d
    1e50:	mov    rsi,rcx
    1e53:	lea    r10,[r11+r8*1]
    1e57:	shl    rax,0x6
    1e5b:	mov    DWORD PTR [rsp-0x44],r15d
    1e60:	vpbroadcastb ymm11,ebx
    1e66:	mov    ebx,0x1
    1e6b:	mov    QWORD PTR [rsp-0x10],rax
    1e70:	lea    eax,[r14+0x1]
    1e74:	add    rdx,r9
    1e77:	vpbroadcastb ymm9,ebx
    1e7d:	mov    ebx,0x2
    1e82:	mov    DWORD PTR [rsp-0x4c],eax
    1e86:	sub    rsi,r8
    1e89:	vpbroadcastb ymm10,ebx
    1e8f:	lea    ebx,[r15-0x1]
    1e93:	mov    rax,r8
    1e96:	add    rdi,r13
    1e99:	mov    DWORD PTR [rsp-0x48],ebx
    1e9d:	mov    r15,r9
    1ea0:	mov    rbx,r13
    1ea3:	data16 cs nop WORD PTR [rax+rax*1+0x0]
    1eae:	xchg   ax,ax
    1eb0:	cmp    DWORD PTR [rsp-0x8],0x1e
    1eb5:	jbe    21a0 <step+0x3e0>
    1ebb:	lea    r14,[rax+r8*1]
    1ebf:	lea    r12,[r10+0x1]
    1ec3:	mov    QWORD PTR [rsp],r14
    1ec7:	lea    r14,[rcx+0x1]
    1ecb:	mov    r9,r12
    1ece:	vmovq  xmm7,r14
    1ed3:	mov    r14,rdx
    1ed6:	sub    r14,r15
    1ed9:	mov    QWORD PTR [rsp-0x20],r14
    1ede:	lea    r14,[rdx+0x1]
    1ee2:	sub    r9,r14
    1ee5:	vmovq  xmm6,r14
    1eea:	vmovq  r14,xmm7
    1eef:	cmp    r9,0x40
    1ef3:	mov    r9,r12
    1ef6:	seta   r13b
    1efa:	sub    r9,r14
    1efd:	cmp    r9,0x40
    1f01:	seta   r9b
    1f05:	test   r13b,r9b
    1f08:	je     21a8 <step+0x3e8>
    1f0e:	mov    r9,r11
    1f11:	sub    r9,r15
    1f14:	cmp    r9,0x40
    1f18:	jbe    21a8 <step+0x3e8>
    1f1e:	cmp    DWORD PTR [rsp-0x8],0x3e
    1f23:	jbe    220c <step+0x44c>
    1f29:	lea    r14,[rdx+0x2]
    1f2d:	lea    r13,[rsi+0x1]
    1f31:	mov    QWORD PTR [rsp-0x28],r10
    1f36:	mov    QWORD PTR [rsp-0x30],r8
    1f3b:	vmovq  xmm15,r14
    1f40:	lea    r14,[rsi+0x2]
    1f44:	mov    r8,r12
    1f47:	mov    QWORD PTR [rsp-0x40],rdi
    1f4c:	vmovq  xmm14,r14
    1f51:	lea    r14,[rcx+0x2]
    1f55:	mov    r12,rax
    1f58:	xor    r9d,r9d
    1f5b:	vmovq  xmm1,r14
    1f60:	mov    r14d,0x3
    1f66:	vmovq  rax,xmm15
    1f6b:	vpbroadcastb zmm12,r14d
    1f71:	mov    r14d,0x1
    1f77:	vmovq  r10,xmm1
    1f7c:	vpbroadcastb zmm4,r14d
    1f82:	mov    r14d,0x2
    1f88:	vpbroadcastb zmm8,r14d
    1f8e:	vmovq  xmm1,rbx
    1f93:	mov    rbx,r13
    1f96:	vmovq  r14,xmm6
    1f9b:	vmovq  r13,xmm14
    1fa0:	vmovq  rdi,xmm7
    1fa5:	data16 cs nop WORD PTR [rax+rax*1+0x0]
    1fb0:	vmovdqu8 zmm2,ZMMWORD PTR [r14+r9*1]
    1fb7:	vpaddb zmm0,zmm2,ZMMWORD PTR [rdx+r9*1]
    1fbe:	vpaddb zmm0,zmm0,ZMMWORD PTR [rax+r9*1]
    1fc5:	vpaddb zmm0,zmm0,ZMMWORD PTR [rsi+r9*1]
    1fcc:	vpaddb zmm0,zmm0,ZMMWORD PTR [r13+r9*1+0x0]
    1fd4:	vpaddb zmm0,zmm0,ZMMWORD PTR [rcx+r9*1]
    1fdb:	vpaddb zmm0,zmm0,ZMMWORD PTR [rdi+r9*1]
    1fe2:	vpaddb zmm0,zmm0,ZMMWORD PTR [r10+r9*1]
    1fe9:	vpcmpeqb k1,zmm0,zmm12
    1ff0:	vmovdqu8 zmm3{k1}{z},zmm4
    1ff6:	vpcmpeqb k1,zmm0,zmm8
    1ffd:	vmovdqu8 zmm5{k1}{z},zmm4
    2003:	vpternlogd zmm3,zmm5,ZMMWORD PTR [rbx+r9*1],0xf8
    200b:	vmovdqu8 ZMMWORD PTR [r8+r9*1],zmm3
    2012:	add    r9,0x40
    2016:	cmp    QWORD PTR [rsp-0x10],r9
    201b:	jne    1fb0 <step+0x1f0>
    201d:	mov    rax,r12
    2020:	mov    r12d,DWORD PTR [rsp-0x38]
    2025:	mov    r10,QWORD PTR [rsp-0x28]
    202a:	mov    r8,QWORD PTR [rsp-0x30]
    202f:	mov    rdi,QWORD PTR [rsp-0x40]
    2034:	vmovq  rbx,xmm1
    2039:	cmp    DWORD PTR [rsp-0x34],r12d
    203e:	je     2156 <step+0x396>
    2044:	mov    r14d,DWORD PTR [rsp-0x44]
    2049:	cmp    DWORD PTR [rsp-0x48],0x1e
    204e:	mov    DWORD PTR [rsp-0x28],r14d
    2053:	jbe    2226 <step+0x466>
    2059:	mov    r14d,DWORD PTR [rsp-0x4c]
    205e:	mov    DWORD PTR [rsp-0x30],r14d
    2063:	mov    r14,QWORD PTR [rsp-0x20]
    2068:	mov    r13,QWORD PTR [rsp]
    206c:	lea    r9,[rax+r12*1]
    2070:	lea    rax,[rax+r12*1+0x1]
    2075:	vmovdqu8 ymm3,YMMWORD PTR [r15+rax*1]
    207c:	add    r14,r12
    207f:	add    r13,r12
    2082:	vmovdqu8 ymm6,YMMWORD PTR [r15+r14*1]
    2089:	vpaddb ymm0,ymm6,YMMWORD PTR [r15+r9*1]
    208f:	vpaddb ymm0,ymm0,YMMWORD PTR [r15+r13*1]
    2095:	vpaddb ymm0,ymm0,YMMWORD PTR [r15+r14*1+0x1]
    209c:	vpaddb ymm0,ymm0,YMMWORD PTR [r15+r14*1+0x2]
    20a3:	vpaddb ymm0,ymm0,YMMWORD PTR [r15+r9*1+0x2]
    20aa:	vpaddb ymm0,ymm0,YMMWORD PTR [r15+r13*1+0x1]
    20b1:	vpaddb ymm0,ymm0,YMMWORD PTR [r15+r13*1+0x2]
    20b8:	mov    r14d,DWORD PTR [rsp-0x28]
    20bd:	mov    r9d,DWORD PTR [rsp-0x30]
    20c2:	vpcmpeqb ymm4,ymm0,ymm11
    20c7:	vpcmpeqb ymm0,ymm0,ymm10
    20cc:	vpternlogd ymm3,ymm9,ymm0,0x80
    20d3:	vpternlogd ymm3,ymm9,ymm4,0xf8
    20da:	vmovdqu8 YMMWORD PTR [r11+rax*1],ymm3
    20e1:	mov    eax,r14d
    20e4:	and    eax,0xffffffe0
    20e7:	add    eax,r9d
    20ea:	and    r14d,0x1f
    20ee:	je     2156 <step+0x396>
    20f0:	mov    r13d,DWORD PTR [rsp-0x34]
    20f5:	cdqe
    20f7:	nop    WORD PTR [rax+rax*1+0x0]
    2100:	movzx  r12d,BYTE PTR [rdx+rax*1]
    2105:	movzx  r9d,BYTE PTR [rsi+rax*1-0x1]
    210b:	movzx  r14d,BYTE PTR [rcx+rax*1-0x1]
    2111:	add    r9b,BYTE PTR [rdx+rax*1+0x1]
    2116:	add    r12b,BYTE PTR [rdx+rax*1-0x1]
    211b:	add    r14b,BYTE PTR [rsi+rax*1+0x1]
    2120:	add    r12d,r9d
    2123:	movzx  r9d,BYTE PTR [rcx+rax*1+0x1]
    2129:	add    r9b,BYTE PTR [rcx+rax*1]
    212d:	add    r9d,r14d
    2130:	add    r9d,r12d
    2133:	cmp    r9b,0x2
    2137:	sete   r12b
    213b:	and    r12b,BYTE PTR [rsi+rax*1]
    213f:	cmp    r9b,0x3
    2143:	sete   r9b
    2147:	or     r9d,r12d
    214a:	mov    BYTE PTR [r10+rax*1],r9b
    214e:	inc    rax
    2151:	cmp    r13d,eax
    2154:	jge    2100 <step+0x340>
    2156:	inc    DWORD PTR [rsp-0x4]
    215a:	mov    r14d,DWORD PTR [rsp-0x4]
    215f:	vmovd  r9d,xmm16
    2165:	mov    rax,QWORD PTR [rsp]
    2169:	add    r10,r8
    216c:	add    rcx,r8
    216f:	add    QWORD PTR [rsp-0x18],r8
    2174:	add    rdx,r8
    2177:	add    rsi,r8
    217a:	cmp    r14d,r9d
    217d:	jne    1eb0 <step+0xf0>
    2183:	vzeroupper
    2186:	lea    rsp,[rbp-0x28]
    218a:	pop    rbx
    218b:	pop    r12
    218d:	pop    r13
    218f:	pop    r14
    2191:	pop    r15
    2193:	pop    rbp
    2194:	ret
    2195:	data16 cs nop WORD PTR [rax+rax*1+0x0]
    21a0:	lea    r14,[rax+r8*1]
    21a4:	mov    QWORD PTR [rsp],r14
    21a8:	mov    r13,QWORD PTR [rsp-0x18]
    21ad:	nop    DWORD PTR [rax]
    21b0:	movzx  r12d,BYTE PTR [rbx+rax*1]
    21b5:	movzx  r9d,BYTE PTR [rbx+rax*1+0x2]
    21bb:	movzx  r14d,BYTE PTR [rdi+rax*1+0x1]
    21c1:	add    r9b,BYTE PTR [r15+rax*1]
    21c5:	add    r12b,BYTE PTR [rbx+rax*1+0x1]
    21ca:	add    r14b,BYTE PTR [rdi+rax*1+0x2]
    21cf:	add    r12d,r9d
    21d2:	movzx  r9d,BYTE PTR [r15+rax*1+0x2]
    21d8:	add    r9b,BYTE PTR [rdi+rax*1]
    21dc:	add    r9d,r14d
    21df:	add    r9d,r12d
    21e2:	cmp    r9b,0x2
    21e6:	sete   r12b
    21ea:	and    r12b,BYTE PTR [r15+rax*1+0x1]
    21ef:	cmp    r9b,0x3
    21f3:	sete   r9b
    21f7:	or     r9d,r12d
    21fa:	mov    BYTE PTR [r11+rax*1+0x1],r9b
    21ff:	inc    rax
    2202:	cmp    r13,rax
    2205:	jne    21b0 <step+0x3f0>
    2207:	jmp    2156 <step+0x396>
    220c:	mov    r14d,DWORD PTR [rsp-0x34]
    2211:	xor    r12d,r12d
    2214:	mov    DWORD PTR [rsp-0x30],0x1
    221c:	mov    DWORD PTR [rsp-0x28],r14d
    2221:	jmp    2063 <step+0x2a3>
    2226:	mov    eax,DWORD PTR [rsp-0x4c]
    222a:	jmp    20f0 <step+0x330>


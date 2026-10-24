0000000000001c30 <step>:
    1c30:	endbr64
    1c34:	push   rbp
    1c35:	mov    rbp,rsp
    1c38:	push   r15
    1c3a:	push   r14
    1c3c:	push   r13
    1c3e:	push   r12
    1c40:	push   rbx
    1c41:	sub    rsp,0x40
    1c45:	mov    ebx,DWORD PTR [rdi]
    1c47:	mov    eax,DWORD PTR [rdi+0x4]
    1c4a:	mov    rdx,QWORD PTR [rdi+0x8]
    1c4e:	mov    r15,QWORD PTR [rsi+0x8]
    1c52:	mov    DWORD PTR [rbp-0x48],ebx
    1c55:	test   ebx,ebx
    1c57:	jle    2238 <step+0x608>
    1c5d:	movsxd r9,eax
    1c60:	mov    ecx,eax
    1c62:	mov    DWORD PTR [rbp-0x44],0x1
    1c69:	movq   xmm4,QWORD PTR [rip+0x181f]        # 3490 <glider.0+0x30>
    1c71:	lea    rax,[r9-0x1]
    1c75:	lea    r13,[r9+0x1]
    1c79:	neg    ecx
    1c7b:	mov    r12,r9
    1c7e:	mov    QWORD PTR [rbp-0x58],rax
    1c82:	lea    eax,[rbx-0x1]
    1c85:	movsxd rdi,ecx
    1c88:	movdqa xmm3,XMMWORD PTR [rip+0x1800]        # 3490 <glider.0+0x30>
    1c90:	lea    r14,[rax+r13*1]
    1c94:	mov    DWORD PTR [rbp-0x6c],eax
    1c97:	lea    eax,[rbx+0x1]
    1c9a:	mov    r10,r13
    1c9d:	mov    DWORD PTR [rbp-0x70],eax
    1ca0:	mov    eax,ebx
    1ca2:	lea    rsi,[rdi-0x1]
    1ca6:	and    ebx,0xfffffff0
    1ca9:	shr    eax,0x4
    1cac:	mov    QWORD PTR [rbp-0xe0],rsi
    1cb3:	lea    rsi,[rdi+0x1]
    1cb7:	movdqa xmm1,XMMWORD PTR [rip+0x17e1]        # 34a0 <glider.0+0x40>
    1cbf:	shl    rax,0x4
    1cc3:	mov    QWORD PTR [rbp-0x50],rsi
    1cc7:	lea    rsi,[rdx+0x1]
    1ccb:	movdqa xmm2,XMMWORD PTR [rip+0x17dd]        # 34b0 <glider.0+0x50>
    1cd3:	mov    QWORD PTR [rbp-0xc0],rax
    1cda:	lea    eax,[rbx+0x1]
    1cdd:	mov    DWORD PTR [rbp-0xb8],eax
    1ce3:	lea    rax,[rdx+r9*1]
    1ce7:	mov    QWORD PTR [rbp-0x80],rdi
    1ceb:	mov    DWORD PTR [rbp-0xb4],ebx
    1cf1:	lea    rbx,[rdx+rdi*1]
    1cf5:	add    rdi,rsi
    1cf8:	mov    QWORD PTR [rbp-0x78],rax
    1cfc:	add    rax,0x1
    1d00:	lea    r11,[rbx+r9*2]
    1d04:	mov    QWORD PTR [rbp-0xc8],rsi
    1d0b:	mov    QWORD PTR [rbp-0xd0],rdi
    1d12:	mov    QWORD PTR [rbp-0xd8],rax
    1d19:	mov    QWORD PTR [rbp-0x60],r13
    1d1d:	mov    r13,r12
    1d20:	mov    r12,r14
    1d23:	mov    QWORD PTR [rbp-0x38],r9
    1d27:	mov    r9,r15
    1d2a:	nop    WORD PTR [rax+rax*1+0x0]
    1d30:	cmp    DWORD PTR [rbp-0x6c],0x6
    1d34:	jbe    22a0 <step+0x670>
    1d3a:	mov    rdi,QWORD PTR [rbp-0x38]
    1d3e:	mov    rsi,QWORD PTR [rbp-0x80]
    1d42:	lea    rax,[r9+r10*1]
    1d46:	mov    rcx,rax
    1d49:	mov    QWORD PTR [rbp-0x88],rax
    1d50:	add    rdi,r13
    1d53:	add    rsi,r13
    1d56:	mov    QWORD PTR [rbp-0x40],rdi
    1d5a:	mov    rdi,QWORD PTR [rbp-0x78]
    1d5e:	mov    QWORD PTR [rbp-0x68],rsi
    1d62:	lea    rsi,[rbx+r10*1]
    1d66:	sub    rax,rsi
    1d69:	add    rdi,r10
    1d6c:	cmp    rax,0x10
    1d70:	mov    rax,rcx
    1d73:	seta   r8b
    1d77:	sub    rax,rdi
    1d7a:	cmp    rax,0x10
    1d7e:	seta   al
    1d81:	test   r8b,al
    1d84:	je     2250 <step+0x620>
    1d8a:	mov    rax,r9
    1d8d:	sub    rax,rdx
    1d90:	cmp    rax,0x10
    1d94:	jbe    2250 <step+0x620>
    1d9a:	cmp    DWORD PTR [rbp-0x6c],0xe
    1d9e:	jbe    22b0 <step+0x680>
    1da4:	mov    rax,QWORD PTR [rbp-0xd0]
    1dab:	mov    r8,QWORD PTR [rbp-0x78]
    1daf:	mov    QWORD PTR [rbp-0xa8],rdx
    1db6:	lea    r15,[rbx+r13*1]
    1dba:	mov    rcx,QWORD PTR [rbp-0xc8]
    1dc1:	mov    QWORD PTR [rbp-0xb0],r9
    1dc8:	lea    r14,[rax+r10*1]
    1dcc:	lea    rax,[rdx+r13*1]
    1dd0:	add    r8,r13
    1dd3:	mov    QWORD PTR [rbp-0x90],rax
    1dda:	mov    rax,QWORD PTR [rbp-0xd8]
    1de1:	add    rcx,r10
    1de4:	mov    QWORD PTR [rbp-0x98],rcx
    1deb:	mov    r9,QWORD PTR [rbp-0x90]
    1df2:	mov    QWORD PTR [rbp-0xa0],r8
    1df9:	lea    rcx,[rax+r10*1]
    1dfd:	lea    r8,[rdx+r10*1]
    1e01:	xor    eax,eax
    1e03:	mov    QWORD PTR [rbp-0x90],r12
    1e0a:	mov    rdx,QWORD PTR [rbp-0x88]
    1e11:	mov    r12,QWORD PTR [rbp-0xa0]
    1e18:	mov    QWORD PTR [rbp-0x88],r10
    1e1f:	mov    r10,QWORD PTR [rbp-0x98]
    1e26:	mov    QWORD PTR [rbp-0x98],r11
    1e2d:	mov    r11,QWORD PTR [rbp-0xc0]
    1e34:	nop    DWORD PTR [rax+0x0]
    1e38:	movdqu xmm7,XMMWORD PTR [r9+rax*1]
    1e3e:	movdqu xmm0,XMMWORD PTR [r14+rax*1]
    1e44:	movdqu xmm5,XMMWORD PTR [rsi+rax*1]
    1e49:	movdqu xmm6,XMMWORD PTR [r12+rax*1]
    1e4f:	paddb  xmm0,xmm7
    1e53:	movdqu xmm7,XMMWORD PTR [r15+rax*1]
    1e59:	paddb  xmm5,xmm7
    1e5d:	movdqu xmm7,XMMWORD PTR [rcx+rax*1]
    1e62:	paddb  xmm0,xmm5
    1e66:	movdqu xmm5,XMMWORD PTR [r10+rax*1]
    1e6c:	paddb  xmm5,xmm6
    1e70:	movdqu xmm6,XMMWORD PTR [r8+rax*1]
    1e76:	paddb  xmm0,xmm5
    1e7a:	movdqu xmm5,XMMWORD PTR [rdi+rax*1]
    1e7f:	paddb  xmm5,xmm7
    1e83:	paddb  xmm0,xmm5
    1e87:	movdqa xmm5,xmm0
    1e8b:	pcmpeqb xmm0,xmm2
    1e8f:	pcmpeqb xmm5,xmm3
    1e93:	pand   xmm0,xmm1
    1e97:	pand   xmm5,xmm1
    1e9b:	pand   xmm0,xmm6
    1e9f:	por    xmm0,xmm5
    1ea3:	movups XMMWORD PTR [rdx+rax*1],xmm0
    1ea7:	add    rax,0x10
    1eab:	cmp    r11,rax
    1eae:	jne    1e38 <step+0x208>
    1eb0:	mov    esi,DWORD PTR [rbp-0x48]
    1eb3:	mov    ecx,DWORD PTR [rbp-0xb4]
    1eb9:	mov    rdx,QWORD PTR [rbp-0xa8]
    1ec0:	mov    r9,QWORD PTR [rbp-0xb0]
    1ec7:	mov    r10,QWORD PTR [rbp-0x88]
    1ece:	mov    r12,QWORD PTR [rbp-0x90]
    1ed5:	mov    r11,QWORD PTR [rbp-0x98]
    1edc:	cmp    esi,ecx
    1ede:	je     2218 <step+0x5e8>
    1ee4:	sub    esi,ecx
    1ee6:	lea    eax,[rsi-0x1]
    1ee9:	cmp    eax,0x6
    1eec:	jbe    22bf <step+0x68f>
    1ef2:	mov    edi,DWORD PTR [rbp-0xb8]
    1ef8:	mov    eax,ecx
    1efa:	mov    r8,QWORD PTR [rbp-0x68]
    1efe:	lea    rcx,[rax+r13*1]
    1f02:	mov    r14,QWORD PTR [rbp-0x40]
    1f06:	movq   xmm8,QWORD PTR [rip+0x1591]        # 34a0 <glider.0+0x40>
    1f0f:	movq   xmm6,QWORD PTR [rdx+rcx*1]
    1f14:	add    r8,rax
    1f17:	add    rax,r14
    1f1a:	movq   xmm5,QWORD PTR [rdx+r8*1+0x2]
    1f21:	movq   xmm0,QWORD PTR [rdx+r8*1+0x1]
    1f28:	paddb  xmm0,xmm5
    1f2c:	movq   xmm5,QWORD PTR [rdx+r8*1]
    1f32:	paddb  xmm5,xmm6
    1f36:	movq   xmm6,QWORD PTR [rdx+rax*1+0x1]
    1f3c:	paddb  xmm0,xmm5
    1f40:	movq   xmm5,QWORD PTR [rdx+rcx*1+0x2]
    1f46:	paddb  xmm6,xmm5
    1f4a:	movq   xmm5,QWORD PTR [rdx+rax*1+0x2]
    1f50:	paddb  xmm6,xmm0
    1f54:	movq   xmm0,QWORD PTR [rdx+rax*1]
    1f59:	paddb  xmm5,xmm0
    1f5d:	movq   xmm0,QWORD PTR [rip+0x154b]        # 34b0 <glider.0+0x50>
    1f65:	paddb  xmm6,xmm5
    1f69:	movq   xmm5,QWORD PTR [rdx+rcx*1+0x1]
    1f6f:	movdqa xmm7,xmm6
    1f73:	pcmpeqb xmm6,xmm0
    1f77:	pcmpeqb xmm7,xmm4
    1f7b:	pand   xmm6,xmm8
    1f80:	pand   xmm7,xmm8
    1f85:	pand   xmm5,xmm6
    1f89:	por    xmm5,xmm7
    1f8d:	movq   QWORD PTR [r9+rcx*1+0x1],xmm5
    1f94:	mov    ecx,esi
    1f96:	and    ecx,0xfffffff8
    1f99:	add    ecx,edi
    1f9b:	and    esi,0x7
    1f9e:	je     2218 <step+0x5e8>
    1fa4:	movsxd r8,ecx
    1fa7:	mov    rdi,QWORD PTR [rbp-0x50]
    1fab:	mov    r14,QWORD PTR [rbp-0xe0]
    1fb2:	add    r8,r13
    1fb5:	mov    r15,QWORD PTR [rbp-0x80]
    1fb9:	lea    rsi,[rdx+r8*1]
    1fbd:	movzx  eax,BYTE PTR [rsi-0x1]
    1fc1:	add    al,BYTE PTR [rsi+0x1]
    1fc4:	add    al,BYTE PTR [rsi+r14*1]
    1fc8:	add    al,BYTE PTR [rsi+r15*1]
    1fcc:	add    al,BYTE PTR [rsi+rdi*1]
    1fcf:	mov    rdi,QWORD PTR [rbp-0x58]
    1fd3:	add    al,BYTE PTR [rsi+rdi*1]
    1fd6:	mov    rdi,QWORD PTR [rbp-0x38]
    1fda:	add    al,BYTE PTR [rsi+rdi*1]
    1fdd:	mov    rdi,QWORD PTR [rbp-0x60]
    1fe1:	add    al,BYTE PTR [rsi+rdi*1]
    1fe4:	cmp    al,0x2
    1fe6:	sete   dil
    1fea:	and    dil,BYTE PTR [rsi]
    1fed:	cmp    al,0x3
    1fef:	sete   al
    1ff2:	or     edi,eax
    1ff4:	mov    BYTE PTR [r9+r8*1],dil
    1ff8:	lea    edi,[rcx+0x1]
    1ffb:	cmp    DWORD PTR [rbp-0x48],edi
    1ffe:	jl     2218 <step+0x5e8>
    2004:	movsxd rdi,edi
    2007:	mov    r8,QWORD PTR [rbp-0x50]
    200b:	add    rdi,r13
    200e:	lea    rsi,[rdx+rdi*1]
    2012:	movzx  eax,BYTE PTR [rsi-0x1]
    2016:	add    al,BYTE PTR [rsi+0x1]
    2019:	add    al,BYTE PTR [rsi+r14*1]
    201d:	add    al,BYTE PTR [rsi+r15*1]
    2021:	add    al,BYTE PTR [rsi+r8*1]
    2025:	mov    r8,QWORD PTR [rbp-0x58]
    2029:	add    al,BYTE PTR [rsi+r8*1]
    202d:	mov    r8,QWORD PTR [rbp-0x38]
    2031:	add    al,BYTE PTR [rsi+r8*1]
    2035:	mov    r8,QWORD PTR [rbp-0x60]
    2039:	add    al,BYTE PTR [rsi+r8*1]
    203d:	cmp    al,0x2
    203f:	sete   r8b
    2043:	and    r8b,BYTE PTR [rsi]
    2046:	cmp    al,0x3
    2048:	sete   al
    204b:	or     r8d,eax
    204e:	mov    BYTE PTR [r9+rdi*1],r8b
    2052:	lea    edi,[rcx+0x2]
    2055:	cmp    DWORD PTR [rbp-0x48],edi
    2058:	jl     2218 <step+0x5e8>
    205e:	movsxd rdi,edi
    2061:	mov    r8,QWORD PTR [rbp-0x50]
    2065:	add    rdi,r13
    2068:	lea    rsi,[rdx+rdi*1]
    206c:	movzx  eax,BYTE PTR [rsi+0x1]
    2070:	add    al,BYTE PTR [rsi-0x1]
    2073:	add    al,BYTE PTR [rsi+r14*1]
    2077:	add    al,BYTE PTR [rsi+r15*1]
    207b:	add    al,BYTE PTR [rsi+r8*1]
    207f:	mov    r8,QWORD PTR [rbp-0x58]
    2083:	add    al,BYTE PTR [rsi+r8*1]
    2087:	mov    r8,QWORD PTR [rbp-0x38]
    208b:	add    al,BYTE PTR [rsi+r8*1]
    208f:	mov    r8,QWORD PTR [rbp-0x60]
    2093:	add    al,BYTE PTR [rsi+r8*1]
    2097:	cmp    al,0x2
    2099:	sete   r8b
    209d:	and    r8b,BYTE PTR [rsi]
    20a0:	cmp    al,0x3
    20a2:	sete   al
    20a5:	or     r8d,eax
    20a8:	mov    BYTE PTR [r9+rdi*1],r8b
    20ac:	lea    edi,[rcx+0x3]
    20af:	cmp    DWORD PTR [rbp-0x48],edi
    20b2:	jl     2218 <step+0x5e8>
    20b8:	movsxd rdi,edi
    20bb:	mov    r8,QWORD PTR [rbp-0x50]
    20bf:	add    rdi,r13
    20c2:	lea    rsi,[rdx+rdi*1]
    20c6:	movzx  eax,BYTE PTR [rsi+0x1]
    20ca:	add    al,BYTE PTR [rsi-0x1]
    20cd:	add    al,BYTE PTR [rsi+r14*1]
    20d1:	add    al,BYTE PTR [rsi+r15*1]
    20d5:	add    al,BYTE PTR [rsi+r8*1]
    20d9:	mov    r8,QWORD PTR [rbp-0x58]
    20dd:	add    al,BYTE PTR [rsi+r8*1]
    20e1:	mov    r8,QWORD PTR [rbp-0x38]
    20e5:	add    al,BYTE PTR [rsi+r8*1]
    20e9:	mov    r8,QWORD PTR [rbp-0x60]
    20ed:	add    al,BYTE PTR [rsi+r8*1]
    20f1:	cmp    al,0x2
    20f3:	sete   r8b
    20f7:	and    r8b,BYTE PTR [rsi]
    20fa:	cmp    al,0x3
    20fc:	sete   al
    20ff:	or     r8d,eax
    2102:	mov    BYTE PTR [r9+rdi*1],r8b
    2106:	lea    edi,[rcx+0x4]
    2109:	cmp    DWORD PTR [rbp-0x48],edi
    210c:	jl     2218 <step+0x5e8>
    2112:	movsxd rdi,edi
    2115:	mov    r8,QWORD PTR [rbp-0x50]
    2119:	add    rdi,r13
    211c:	lea    rsi,[rdx+rdi*1]
    2120:	movzx  eax,BYTE PTR [rsi+0x1]
    2124:	add    al,BYTE PTR [rsi-0x1]
    2127:	add    al,BYTE PTR [rsi+r14*1]
    212b:	add    al,BYTE PTR [rsi+r15*1]
    212f:	add    al,BYTE PTR [rsi+r8*1]
    2133:	mov    r8,QWORD PTR [rbp-0x58]
    2137:	add    al,BYTE PTR [rsi+r8*1]
    213b:	mov    r8,QWORD PTR [rbp-0x38]
    213f:	add    al,BYTE PTR [rsi+r8*1]
    2143:	mov    r8,QWORD PTR [rbp-0x60]
    2147:	add    al,BYTE PTR [rsi+r8*1]
    214b:	cmp    al,0x2
    214d:	sete   r8b
    2151:	and    r8b,BYTE PTR [rsi]
    2154:	cmp    al,0x3
    2156:	sete   al
    2159:	or     r8d,eax
    215c:	mov    BYTE PTR [r9+rdi*1],r8b
    2160:	lea    edi,[rcx+0x5]
    2163:	cmp    DWORD PTR [rbp-0x48],edi
    2166:	jl     2218 <step+0x5e8>
    216c:	movsxd rdi,edi
    216f:	mov    r8,QWORD PTR [rbp-0x50]
    2173:	add    rdi,r13
    2176:	lea    rsi,[rdx+rdi*1]
    217a:	movzx  eax,BYTE PTR [rsi+0x1]
    217e:	add    al,BYTE PTR [rsi-0x1]
    2181:	add    al,BYTE PTR [rsi+r14*1]
    2185:	add    al,BYTE PTR [rsi+r15*1]
    2189:	add    al,BYTE PTR [rsi+r8*1]
    218d:	mov    r8,QWORD PTR [rbp-0x58]
    2191:	add    al,BYTE PTR [rsi+r8*1]
    2195:	mov    r8,QWORD PTR [rbp-0x38]
    2199:	add    al,BYTE PTR [rsi+r8*1]
    219d:	mov    r8,QWORD PTR [rbp-0x60]
    21a1:	add    al,BYTE PTR [rsi+r8*1]
    21a5:	cmp    al,0x2
    21a7:	sete   r8b
    21ab:	and    r8b,BYTE PTR [rsi]
    21ae:	cmp    al,0x3
    21b0:	sete   al
    21b3:	add    ecx,0x6
    21b6:	or     r8d,eax
    21b9:	mov    BYTE PTR [r9+rdi*1],r8b
    21bd:	cmp    DWORD PTR [rbp-0x48],ecx
    21c0:	jl     2218 <step+0x5e8>
    21c2:	movsxd rcx,ecx
    21c5:	mov    r8,QWORD PTR [rbp-0x50]
    21c9:	lea    rax,[rcx+r13*1]
    21cd:	lea    rsi,[rdx+rax*1]
    21d1:	movzx  ecx,BYTE PTR [rsi+0x1]
    21d5:	add    cl,BYTE PTR [rsi-0x1]
    21d8:	add    cl,BYTE PTR [rsi+r14*1]
    21dc:	add    cl,BYTE PTR [rsi+r15*1]
    21e0:	add    cl,BYTE PTR [rsi+r8*1]
    21e4:	mov    r8,QWORD PTR [rbp-0x58]
    21e8:	add    cl,BYTE PTR [rsi+r8*1]
    21ec:	mov    r8,QWORD PTR [rbp-0x38]
    21f0:	add    cl,BYTE PTR [rsi+r8*1]
    21f4:	mov    r8,QWORD PTR [rbp-0x60]
    21f8:	add    cl,BYTE PTR [rsi+r8*1]
    21fc:	cmp    cl,0x2
    21ff:	sete   dil
    2203:	and    dil,BYTE PTR [rsi]
    2206:	cmp    cl,0x3
    2209:	sete   cl
    220c:	or     edi,ecx
    220e:	mov    BYTE PTR [r9+rax*1],dil
    2212:	nop    WORD PTR [rax+rax*1+0x0]
    2218:	mov    rdi,QWORD PTR [rbp-0x38]
    221c:	add    DWORD PTR [rbp-0x44],0x1
    2220:	mov    eax,DWORD PTR [rbp-0x44]
    2223:	mov    r13,QWORD PTR [rbp-0x40]
    2227:	add    r12,rdi
    222a:	add    r10,rdi
    222d:	mov    edi,DWORD PTR [rbp-0x70]
    2230:	cmp    eax,edi
    2232:	jne    1d30 <step+0x100>
    2238:	add    rsp,0x40
    223c:	pop    rbx
    223d:	pop    r12
    223f:	pop    r13
    2241:	pop    r14
    2243:	pop    r15
    2245:	pop    rbp
    2246:	ret
    2247:	nop    WORD PTR [rax+rax*1+0x0]
    2250:	mov    rcx,r13
    2253:	nop    DWORD PTR [rax+rax*1+0x0]
    2258:	movzx  eax,BYTE PTR [rbx+rcx*1]
    225c:	add    al,BYTE PTR [rbx+rcx*1+0x1]
    2260:	add    al,BYTE PTR [rbx+rcx*1+0x2]
    2264:	add    al,BYTE PTR [rdx+rcx*1]
    2267:	add    al,BYTE PTR [rdx+rcx*1+0x2]
    226b:	add    al,BYTE PTR [r11+rcx*1]
    226f:	add    al,BYTE PTR [r11+rcx*1+0x1]
    2274:	add    al,BYTE PTR [r11+rcx*1+0x2]
    2279:	cmp    al,0x2
    227b:	sete   sil
    227f:	and    sil,BYTE PTR [rdx+rcx*1+0x1]
    2284:	cmp    al,0x3
    2286:	sete   al
    2289:	or     eax,esi
    228b:	mov    BYTE PTR [r9+rcx*1+0x1],al
    2290:	add    rcx,0x1
    2294:	cmp    r12,rcx
    2297:	jne    2258 <step+0x628>
    2299:	jmp    2218 <step+0x5e8>
    229e:	xchg   ax,ax
    22a0:	mov    rax,QWORD PTR [rbp-0x38]
    22a4:	mov    rcx,r13
    22a7:	add    rax,r13
    22aa:	mov    QWORD PTR [rbp-0x40],rax
    22ae:	jmp    2258 <step+0x628>
    22b0:	mov    esi,DWORD PTR [rbp-0x48]
    22b3:	mov    edi,0x1
    22b8:	xor    eax,eax
    22ba:	jmp    1efa <step+0x2ca>
    22bf:	mov    ecx,DWORD PTR [rbp-0xb8]
    22c5:	jmp    1fa4 <step+0x374>


0000000000001553 <step>:
    1553:	endbr64
    1557:	push   rbp
    1558:	mov    rbp,rsp
    155b:	push   rbx
    155c:	sub    rsp,0x40
    1560:	mov    QWORD PTR [rbp-0x40],rdi
    1564:	mov    QWORD PTR [rbp-0x48],rsi
    1568:	mov    rax,QWORD PTR [rbp-0x40]
    156c:	mov    eax,DWORD PTR [rax]
    156e:	mov    DWORD PTR [rbp-0x30],eax
    1571:	mov    rax,QWORD PTR [rbp-0x40]
    1575:	mov    eax,DWORD PTR [rax+0x4]
    1578:	mov    DWORD PTR [rbp-0x2c],eax
    157b:	mov    rax,QWORD PTR [rbp-0x40]
    157f:	mov    rax,QWORD PTR [rax+0x8]
    1583:	mov    QWORD PTR [rbp-0x28],rax
    1587:	mov    rax,QWORD PTR [rbp-0x48]
    158b:	mov    rax,QWORD PTR [rax+0x8]
    158f:	mov    QWORD PTR [rbp-0x20],rax
    1593:	mov    DWORD PTR [rbp-0x38],0x1
    159a:	jmp    162b <step+0xd8>
    159f:	mov    eax,DWORD PTR [rbp-0x38]
    15a2:	imul   eax,DWORD PTR [rbp-0x2c]
    15a6:	movsxd rdx,eax
    15a9:	mov    rax,QWORD PTR [rbp-0x28]
    15ad:	add    rax,rdx
    15b0:	mov    QWORD PTR [rbp-0x18],rax
    15b4:	mov    eax,DWORD PTR [rbp-0x38]
    15b7:	imul   eax,DWORD PTR [rbp-0x2c]
    15bb:	movsxd rdx,eax
    15be:	mov    rax,QWORD PTR [rbp-0x20]
    15c2:	add    rax,rdx
    15c5:	mov    QWORD PTR [rbp-0x10],rax
    15c9:	mov    DWORD PTR [rbp-0x34],0x1
    15d0:	jmp    161f <step+0xcc>
    15d2:	mov    eax,DWORD PTR [rbp-0x34]
    15d5:	movsxd rdx,eax
    15d8:	mov    rax,QWORD PTR [rbp-0x18]
    15dc:	add    rdx,rax
    15df:	mov    eax,DWORD PTR [rbp-0x2c]
    15e2:	mov    esi,eax
    15e4:	mov    rdi,rdx
    15e7:	call   13f2 <neighbors>
    15ec:	movzx  edx,al
    15ef:	mov    eax,DWORD PTR [rbp-0x34]
    15f2:	movsxd rcx,eax
    15f5:	mov    rax,QWORD PTR [rbp-0x18]
    15f9:	add    rax,rcx
    15fc:	movzx  eax,BYTE PTR [rax]
    15ff:	movzx  eax,al
    1602:	mov    ecx,DWORD PTR [rbp-0x34]
    1605:	movsxd rsi,ecx
    1608:	mov    rcx,QWORD PTR [rbp-0x10]
    160c:	lea    rbx,[rsi+rcx*1]
    1610:	mov    esi,edx
    1612:	mov    edi,eax
    1614:	call   1497 <rule>
    1619:	mov    BYTE PTR [rbx],al
    161b:	add    DWORD PTR [rbp-0x34],0x1
    161f:	mov    eax,DWORD PTR [rbp-0x34]
    1622:	cmp    eax,DWORD PTR [rbp-0x30]
    1625:	jle    15d2 <step+0x7f>
    1627:	add    DWORD PTR [rbp-0x38],0x1
    162b:	mov    eax,DWORD PTR [rbp-0x38]
    162e:	cmp    eax,DWORD PTR [rbp-0x30]
    1631:	jle    159f <step+0x4c>
    1637:	nop
    1638:	nop
    1639:	mov    rbx,QWORD PTR [rbp-0x8]
    163d:	leave
    163e:	ret

00000000000013f2 <neighbors>:
    13f2:	push   rbp
    13f3:	mov    rbp,rsp
    13f6:	mov    QWORD PTR [rbp-0x8],rdi
    13fa:	mov    DWORD PTR [rbp-0xc],esi
    13fd:	mov    eax,DWORD PTR [rbp-0xc]
    1400:	neg    eax
    1402:	cdqe
    1404:	lea    rdx,[rax-0x1]
    1408:	mov    rax,QWORD PTR [rbp-0x8]
    140c:	add    rax,rdx
    140f:	movzx  ecx,BYTE PTR [rax]
    1412:	mov    eax,DWORD PTR [rbp-0xc]
    1415:	neg    eax
    1417:	movsxd rdx,eax
    141a:	mov    rax,QWORD PTR [rbp-0x8]
    141e:	add    rax,rdx
    1421:	movzx  eax,BYTE PTR [rax]
    1424:	add    ecx,eax
    1426:	mov    eax,DWORD PTR [rbp-0xc]
    1429:	neg    eax
    142b:	cdqe
    142d:	lea    rdx,[rax+0x1]
    1431:	mov    rax,QWORD PTR [rbp-0x8]
    1435:	add    rax,rdx
    1438:	movzx  eax,BYTE PTR [rax]
    143b:	lea    edx,[rcx+rax*1]
    143e:	mov    rax,QWORD PTR [rbp-0x8]
    1442:	sub    rax,0x1
    1446:	movzx  eax,BYTE PTR [rax]
    1449:	add    edx,eax
    144b:	mov    rax,QWORD PTR [rbp-0x8]
    144f:	add    rax,0x1
    1453:	movzx  eax,BYTE PTR [rax]
    1456:	lea    ecx,[rdx+rax*1]
    1459:	mov    eax,DWORD PTR [rbp-0xc]
    145c:	cdqe
    145e:	lea    rdx,[rax-0x1]
    1462:	mov    rax,QWORD PTR [rbp-0x8]
    1466:	add    rax,rdx
    1469:	movzx  eax,BYTE PTR [rax]
    146c:	add    ecx,eax
    146e:	mov    eax,DWORD PTR [rbp-0xc]
    1471:	movsxd rdx,eax
    1474:	mov    rax,QWORD PTR [rbp-0x8]
    1478:	add    rax,rdx
    147b:	movzx  eax,BYTE PTR [rax]
    147e:	add    ecx,eax
    1480:	mov    eax,DWORD PTR [rbp-0xc]
    1483:	cdqe
    1485:	lea    rdx,[rax+0x1]
    1489:	mov    rax,QWORD PTR [rbp-0x8]
    148d:	add    rax,rdx
    1490:	movzx  eax,BYTE PTR [rax]
    1493:	add    eax,ecx
    1495:	pop    rbp
    1496:	ret

0000000000001497 <rule>:
    1497:	push   rbp
    1498:	mov    rbp,rsp
    149b:	mov    edx,edi
    149d:	mov    eax,esi
    149f:	mov    BYTE PTR [rbp-0x4],dl
    14a2:	mov    BYTE PTR [rbp-0x8],al
    14a5:	cmp    BYTE PTR [rbp-0x8],0x3
    14a9:	sete   al
    14ac:	mov    edx,eax
    14ae:	cmp    BYTE PTR [rbp-0x8],0x2
    14b2:	sete   al
    14b5:	mov    ecx,eax
    14b7:	movzx  eax,BYTE PTR [rbp-0x4]
    14bb:	and    eax,ecx
    14bd:	or     eax,edx
    14bf:	pop    rbp
    14c0:	ret


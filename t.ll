; ModuleID = 't.c'
source_filename = "t.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [7 x i8] c"hello\0A\00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"TZ\00", section "llvm.metadata"
@.str.2 = private unnamed_addr constant [4 x i8] c"t.c\00", section "llvm.metadata"
@.str.3 = private unnamed_addr constant [14 x i8] c"memsize(4, 4)\00", section "llvm.metadata"
@.str.4 = private unnamed_addr constant [6 x i8] c"TAFUN\00", section "llvm.metadata"
@.str.5 = private unnamed_addr constant [8 x i8] c"i+j=%d\0A\00", align 1
@llvm.global.annotations = appending global [4 x { i8*, i8*, i8*, i32, i8* }] [{ i8*, i8*, i8*, i32, i8* } { i8* bitcast (i32 (i32, i32)* @inc to i8*), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i32 0, i32 0), i32 9, i8* null }, { i8*, i8*, i8*, i32, i8* } { i8* bitcast (void (i32*, i32*)* @inc_value to i8*), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i32 0, i32 0), i32 15, i8* null }, { i8*, i8*, i8*, i32, i8* } { i8* bitcast (void (i32*, i32*)* @inc_value to i8*), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i32 0, i32 0), i32 15, i8* null }, { i8*, i8*, i8*, i32, i8* } { i8* bitcast (void (i32*, i32*)* @inc_value to i8*), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.4, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i32 0, i32 0), i32 15, i8* null }], section "llvm.metadata"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @ca() #0 !dbg !10 {
  %1 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0)), !dbg !15
  ret i32 0, !dbg !16
}

declare i32 @printf(i8* noundef, ...) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @inc(i32 noundef %0, i32 noundef %1) #0 !dbg !17 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  call void @llvm.dbg.declare(metadata i32* %3, metadata !20, metadata !DIExpression()), !dbg !21
  store i32 %1, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !22, metadata !DIExpression()), !dbg !23
  %5 = load i32, i32* %3, align 4, !dbg !24
  %6 = load i32, i32* %4, align 4, !dbg !25
  %7 = add nsw i32 %5, %6, !dbg !26
  ret i32 %7, !dbg !27
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @inc_value(i32* noundef %0, i32* noundef %1) #0 !dbg !28 {
  %3 = alloca i32*, align 8
  %4 = alloca i32*, align 8
  store i32* %0, i32** %3, align 8
  call void @llvm.dbg.declare(metadata i32** %3, metadata !32, metadata !DIExpression()), !dbg !33
  store i32* %1, i32** %4, align 8
  call void @llvm.dbg.declare(metadata i32** %4, metadata !34, metadata !DIExpression()), !dbg !35
  %5 = load i32*, i32** %3, align 8, !dbg !36
  %6 = load i32, i32* %5, align 4, !dbg !37
  %7 = load i32*, i32** %4, align 8, !dbg !38
  %8 = load i32, i32* %7, align 4, !dbg !39
  %9 = call i32 @inc(i32 noundef %6, i32 noundef %8), !dbg !40
  %10 = load i32*, i32** %3, align 8, !dbg !41
  store i32 %9, i32* %10, align 4, !dbg !42
  ret void, !dbg !43
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !44 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  call void @llvm.dbg.declare(metadata i32* %2, metadata !45, metadata !DIExpression()), !dbg !46
  store i32 42, i32* %2, align 4, !dbg !46
  call void @llvm.dbg.declare(metadata i32* %3, metadata !47, metadata !DIExpression()), !dbg !48
  store i32 1, i32* %3, align 4, !dbg !48
  call void @inc_value(i32* noundef %2, i32* noundef %3), !dbg !49
  %4 = load i32, i32* %2, align 4, !dbg !50
  %5 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), i32 noundef %4), !dbg !51
  %6 = call i32 @ca(), !dbg !52
  ret i32 0, !dbg !53
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7, !8}
!llvm.ident = !{!9}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "t.c", directory: "/home/yxk/attributes", checksumkind: CSK_MD5, checksum: "954c0bf7bc79dec99cca08cafd1a9c3f")
!2 = !{i32 7, !"Dwarf Version", i32 5}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"PIE Level", i32 2}
!7 = !{i32 7, !"uwtable", i32 1}
!8 = !{i32 7, !"frame-pointer", i32 2}
!9 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!10 = distinct !DISubprogram(name: "ca", scope: !1, file: !1, line: 3, type: !11, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{}
!15 = !DILocation(line: 4, column: 1, scope: !10)
!16 = !DILocation(line: 5, column: 1, scope: !10)
!17 = distinct !DISubprogram(name: "inc", scope: !1, file: !1, line: 9, type: !18, scopeLine: 10, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!18 = !DISubroutineType(types: !19)
!19 = !{!13, !13, !13}
!20 = !DILocalVariable(name: "a", arg: 1, scope: !17, file: !1, line: 9, type: !13)
!21 = !DILocation(line: 9, column: 13, scope: !17)
!22 = !DILocalVariable(name: "b", arg: 2, scope: !17, file: !1, line: 9, type: !13)
!23 = !DILocation(line: 9, column: 20, scope: !17)
!24 = !DILocation(line: 11, column: 8, scope: !17)
!25 = !DILocation(line: 11, column: 10, scope: !17)
!26 = !DILocation(line: 11, column: 9, scope: !17)
!27 = !DILocation(line: 11, column: 1, scope: !17)
!28 = distinct !DISubprogram(name: "inc_value", scope: !1, file: !1, line: 15, type: !29, scopeLine: 16, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!29 = !DISubroutineType(types: !30)
!30 = !{null, !31, !31}
!31 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!32 = !DILocalVariable(name: "a", arg: 1, scope: !28, file: !1, line: 15, type: !31)
!33 = !DILocation(line: 15, column: 21, scope: !28)
!34 = !DILocalVariable(name: "b", arg: 2, scope: !28, file: !1, line: 15, type: !31)
!35 = !DILocation(line: 15, column: 29, scope: !28)
!36 = !DILocation(line: 17, column: 11, scope: !28)
!37 = !DILocation(line: 17, column: 10, scope: !28)
!38 = !DILocation(line: 17, column: 15, scope: !28)
!39 = !DILocation(line: 17, column: 14, scope: !28)
!40 = !DILocation(line: 17, column: 6, scope: !28)
!41 = !DILocation(line: 17, column: 2, scope: !28)
!42 = !DILocation(line: 17, column: 4, scope: !28)
!43 = !DILocation(line: 18, column: 1, scope: !28)
!44 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 20, type: !11, scopeLine: 20, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!45 = !DILocalVariable(name: "i", scope: !44, file: !1, line: 21, type: !13)
!46 = !DILocation(line: 21, column: 5, scope: !44)
!47 = !DILocalVariable(name: "j", scope: !44, file: !1, line: 22, type: !13)
!48 = !DILocation(line: 22, column: 5, scope: !44)
!49 = !DILocation(line: 23, column: 1, scope: !44)
!50 = !DILocation(line: 24, column: 20, scope: !44)
!51 = !DILocation(line: 24, column: 1, scope: !44)
!52 = !DILocation(line: 25, column: 1, scope: !44)
!53 = !DILocation(line: 26, column: 1, scope: !44)

; ModuleID = 't.c'
source_filename = "t.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [3 x i8] c"TZ\00", section "llvm.metadata"
@.str.1 = private unnamed_addr constant [4 x i8] c"t.c\00", section "llvm.metadata"
@.str.2 = private unnamed_addr constant [14 x i8] c"memsize(4, 4)\00", section "llvm.metadata"
@.str.3 = private unnamed_addr constant [6 x i8] c"TAFUN\00", section "llvm.metadata"
@.str.4 = private unnamed_addr constant [8 x i8] c"i+j=%d\0A\00", align 1
@llvm.global.annotations = appending global [4 x { i8*, i8*, i8*, i32, i8* }] [{ i8*, i8*, i8*, i32, i8* } { i8* bitcast (i32 (i32, i32)* @inc to i8*), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0), i32 4, i8* null }, { i8*, i8*, i8*, i32, i8* } { i8* bitcast (void (i32*, i32*)* @inc_value to i8*), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0), i32 10, i8* null }, { i8*, i8*, i8*, i32, i8* } { i8* bitcast (void (i32*, i32*)* @inc_value to i8*), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0), i32 10, i8* null }, { i8*, i8*, i8*, i32, i8* } { i8* bitcast (void (i32*, i32*)* @inc_value to i8*), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0), i32 10, i8* null }], section "llvm.metadata"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @inc(i32 noundef %0, i32 noundef %1) #0 !dbg !10 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  call void @llvm.dbg.declare(metadata i32* %3, metadata !15, metadata !DIExpression()), !dbg !16
  store i32 %1, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !17, metadata !DIExpression()), !dbg !18
  %5 = load i32, i32* %3, align 4, !dbg !19
  %6 = load i32, i32* %4, align 4, !dbg !20
  %7 = add nsw i32 %5, %6, !dbg !21
  ret i32 %7, !dbg !22
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @inc_value(i32* noundef %0, i32* noundef %1) #0 !dbg !23 {
  %3 = alloca i32*, align 8
  %4 = alloca i32*, align 8
  store i32* %0, i32** %3, align 8
  call void @llvm.dbg.declare(metadata i32** %3, metadata !27, metadata !DIExpression()), !dbg !28
  store i32* %1, i32** %4, align 8
  call void @llvm.dbg.declare(metadata i32** %4, metadata !29, metadata !DIExpression()), !dbg !30
  %5 = load i32*, i32** %3, align 8, !dbg !31
  %6 = load i32, i32* %5, align 4, !dbg !32
  %7 = load i32*, i32** %4, align 8, !dbg !33
  %8 = load i32, i32* %7, align 4, !dbg !34
  %9 = call i32 @inc(i32 noundef %6, i32 noundef %8), !dbg !35
  %10 = load i32*, i32** %3, align 8, !dbg !36
  store i32 %9, i32* %10, align 4, !dbg !37
  ret void, !dbg !38
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !39 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  call void @llvm.dbg.declare(metadata i32* %2, metadata !42, metadata !DIExpression()), !dbg !43
  store i32 42, i32* %2, align 4, !dbg !43
  call void @llvm.dbg.declare(metadata i32* %3, metadata !44, metadata !DIExpression()), !dbg !45
  store i32 1, i32* %3, align 4, !dbg !45
  call void @inc_value(i32* noundef %2, i32* noundef %3), !dbg !46
  %4 = load i32, i32* %2, align 4, !dbg !47
  %5 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([8 x i8], [8 x i8]* @.str.4, i64 0, i64 0), i32 noundef %4), !dbg !48
  ret i32 0, !dbg !49
}

declare i32 @printf(i8* noundef, ...) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7, !8}
!llvm.ident = !{!9}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "t.c", directory: "/home/yxk/attributes", checksumkind: CSK_MD5, checksum: "11ed14ae9bc3be8012b6939aec5e6837")
!2 = !{i32 7, !"Dwarf Version", i32 5}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"PIE Level", i32 2}
!7 = !{i32 7, !"uwtable", i32 1}
!8 = !{i32 7, !"frame-pointer", i32 2}
!9 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!10 = distinct !DISubprogram(name: "inc", scope: !1, file: !1, line: 4, type: !11, scopeLine: 5, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!11 = !DISubroutineType(types: !12)
!12 = !{!13, !13, !13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{}
!15 = !DILocalVariable(name: "a", arg: 1, scope: !10, file: !1, line: 4, type: !13)
!16 = !DILocation(line: 4, column: 13, scope: !10)
!17 = !DILocalVariable(name: "b", arg: 2, scope: !10, file: !1, line: 4, type: !13)
!18 = !DILocation(line: 4, column: 20, scope: !10)
!19 = !DILocation(line: 6, column: 8, scope: !10)
!20 = !DILocation(line: 6, column: 10, scope: !10)
!21 = !DILocation(line: 6, column: 9, scope: !10)
!22 = !DILocation(line: 6, column: 1, scope: !10)
!23 = distinct !DISubprogram(name: "inc_value", scope: !1, file: !1, line: 10, type: !24, scopeLine: 11, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!24 = !DISubroutineType(types: !25)
!25 = !{null, !26, !26}
!26 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!27 = !DILocalVariable(name: "a", arg: 1, scope: !23, file: !1, line: 10, type: !26)
!28 = !DILocation(line: 10, column: 21, scope: !23)
!29 = !DILocalVariable(name: "b", arg: 2, scope: !23, file: !1, line: 10, type: !26)
!30 = !DILocation(line: 10, column: 29, scope: !23)
!31 = !DILocation(line: 12, column: 11, scope: !23)
!32 = !DILocation(line: 12, column: 10, scope: !23)
!33 = !DILocation(line: 12, column: 15, scope: !23)
!34 = !DILocation(line: 12, column: 14, scope: !23)
!35 = !DILocation(line: 12, column: 6, scope: !23)
!36 = !DILocation(line: 12, column: 2, scope: !23)
!37 = !DILocation(line: 12, column: 4, scope: !23)
!38 = !DILocation(line: 13, column: 1, scope: !23)
!39 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 15, type: !40, scopeLine: 15, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!40 = !DISubroutineType(types: !41)
!41 = !{!13}
!42 = !DILocalVariable(name: "i", scope: !39, file: !1, line: 16, type: !13)
!43 = !DILocation(line: 16, column: 5, scope: !39)
!44 = !DILocalVariable(name: "j", scope: !39, file: !1, line: 17, type: !13)
!45 = !DILocation(line: 17, column: 5, scope: !39)
!46 = !DILocation(line: 18, column: 1, scope: !39)
!47 = !DILocation(line: 19, column: 20, scope: !39)
!48 = !DILocation(line: 19, column: 1, scope: !39)
!49 = !DILocation(line: 20, column: 1, scope: !39)

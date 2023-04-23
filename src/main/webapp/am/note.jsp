<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <!-- include libraries(jQuery, bootstrap) -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <!-- 로컬 파일 summernote css/js -->
    <!-- <script src="../4.surmmernote/lib/summernote-bs4.js"></script> -->
    <!-- <link rel="stylesheet" href="../4.surmmernote/lib/summernote-bs4.css"> -->

    <!-- CDN 파일 summernote css/js -->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

    <!-- CDN 한글화 -->
    <script src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>
    <!-- 로컬 파일 한글화 -->
    <!-- <script src="../4.surmmernote/lib/lang/summernote-ko-KR.min.js"></script> -->
    <!-- <script src="../4.surmmernote/lib/lang/summernote-ko-KR.js"></script> -->
</head>
<body>
    <textarea name="noticeDoc" id="summernote" maxlength="5000"></textarea>
<script>
    $(document).ready(function() {
        $('#summernote').summernote({
            height: 300,                 // set editor height
            minHeight: null,             // set minimum height of editor
            maxHeight: null,             // set maximum height of editor
            focus: true,                 // set focus to editable area after initializing summernote
            lang: "ko-KR",
            placeholder: '최대 제한은 5000자입니다.'
        });
    });

    $(document).ready(function() {
        $('#summernote').summernote();
        $(".note-insert button[aria-label*='그림']" ).hide();
    });

</script>
</body>
</html>
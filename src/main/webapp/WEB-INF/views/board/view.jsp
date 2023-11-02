<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <style>
        .search-form {
  width: 80%;
  margin: 0 auto;
  margin-top: 1rem;
}

.search-form input {
  height: 100%;
  background: transparent;
  border: 0;
  display: block;
  width: 100%;
  padding: 1rem;
  height: 100%;
  font-size: 1rem;
}

.search-form select {
  background: transparent;
  border: 0;
  padding: 1rem;
  height: 100%;
  font-size: 1rem;
}

.search-form select:focus {
  border: 0;
}

.search-form button {
  height: 100%;
  width: 100%;
  font-size: 1rem;
}

.search-form button svg {
  width: 24px;
  height: 24px;
}

.card-margin {
  margin-bottom: 1.875rem;
}

@media (min-width: 992px) {
  .col-lg-2 {
    flex: 0 0 16.66667%;
    max-width: 16.66667%;
  }
}

.card {
  border: 0;
  box-shadow: 0px 0px 10px 0px rgba(82, 63, 105, 0.1);
  -webkit-box-shadow: 0px 0px 10px 0px rgba(82, 63, 105, 0.1);
  -moz-box-shadow: 0px 0px 10px 0px rgba(82, 63, 105, 0.1);
  -ms-box-shadow: 0px 0px 10px 0px rgba(82, 63, 105, 0.1);
}

.card {
  position: relative;
  display: flex;
  flex-direction: column;
  min-width: 0;
  word-wrap: break-word;
  background-color: #ffffff;
  background-clip: border-box;
  border: 1px solid #e6e4e9;
  border-radius: 8px;
}

    </style>

</head>
<body>
    <main class="container">
        <header class="py-5 text-center">
            <h1>첫번째 글</h1>
        </header>
    
    
        <div class="row g-5">
            <section class="col-md-3 col-lg-4 order-md-last">
                <aside>
                    <p>Jyc</p>
                    <p><a href="mailto:jyc4648@gmail.com">작성자 이메일 주소</a></p>
                    <p>
                        <time datetime="2022-01-01T00:00:00">2022-01-01</time>
                    </p>
                    <p>#java</p>
                </aside>
            </section>
    
            <article id="article-content" class="col-md-9 col-lg-8">
                <pre>본문</pre>
            </article>
    
    
        </div>
        </div>
    
        <div class="row 9-5">
            <sectoin>
                <form class="row g-3">
    
                    <div class="col-md-9 col-lg-8">
                        <label for="articleComment" hidden>댓글</label>
                        <textarea class="form-control" id="articleComment" placeholder="댓글 쓰기.." rows="3"
                                  required></textarea>
                    </div>
                    <div class="col-md-3 col-lg-4">
                        <label for="comment-submit" hidden>댓글 쓰기</label>
                        <button class="btn btn-primary" id="comment-submit" type="submit">쓰기</button>
                    </div>
    
                </form>
    
                <ul id="article-comments" class="row col-md-10 col-lg-8 pt-3">
                    <li>
                        <form>
                            <input hidden class="article-id">
                            <div class="row">
                                <div class="row col-md-10 col-lg-9">
                                    <strong>Jyc</strong>
                                    <small>
                                        <time>2022-01-01</time>
                                    </small>
                                    <p>
                                        Lorem ipsum dolor sit amet, consectetur adipiscing elit.<br>
                                        Lorem ipsum dolor sit amet
                                    </p>
                                </div>
                            </div>
                        </form>
                    </li>
                    <li>
                        <form>
                            <input hidden class="article-id">
                            <div class="row">
                                <div class="row col-md-10 col-lg-9">
                                    <strong>Jyc</strong>
                                    <small>
                                        <time>2022-01-01</time>
                                    </small>
                                    <p>
                                        Lorem ipsum dolor sit amet, consectetur adipiscing elit.<br>
                                        Lorem ipsum dolor sit amet
                                    </p>
                                </div>
                            </div>
                        </form>
                    </li>
                </ul>
    
            </sectoin>
        </div>
        <div class="row g-5">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <li class="page-item">
                        <a class="page-link" href="#" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                            <span class="sr-only">이전글</span>
                        </a>
                    </li>
    
                    <li class="page-item">
                        <a class="page-link" href="#" aria-label="Next">
                            <span aria-hidden="true">&raquo; </span>
                            <span class="sr-only">다음글</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
    </main>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
</body>
</html>
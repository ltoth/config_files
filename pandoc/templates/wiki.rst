#format rst

$if(title)$
$title$

$endif$
$for(author)$
:Author: $author$
$endfor$
$if(date)$
:Date:   $date$
$endif$
$if(author)$

$else$
$if(date)$

$endif$
$endif$
$if(math)$
.. role:: math(raw)
   :format: html latex
..

$endif$
$for(include-before)$
$include-before$

$endfor$
$if(toc)$
.. macro:: <<Navigation(siblings)>>

.. contents:: :local:
   :backlinks: none
   :depth: $toc-depth$
..

$endif$
$for(header-includes)$
$header-includes$

$endfor$
$body$
$for(include-after)$

$include-after$
$endfor$

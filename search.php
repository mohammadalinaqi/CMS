<?php
/**
 * Created by PhpStorm.
 * User: Mohammad Ali
 * Date: 2/7/2019
 * Time: 3:25 PM
 */
?>
<section id="search" class="search sm-search">
    <header>
        جستجو
    </header>
    <div>
        <form id="search-form">
            <input id="search-text" type="hidden" name="action" value="search" />
            <input id="search-place" type="search" name="q" placeholder="جستجو کنید" />
            <input id="search-submit" type="submit" value="جستجو در" />
            <input type="checkbox" name="title" value="yes" checked="checked" /> عنوان
            <input type="checkbox" name="content" value="yes" checked="checked" /> توضیحات
        </form>
    </div>
</section>

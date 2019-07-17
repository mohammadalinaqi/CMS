<?php
/**
 * Created by PhpStorm.
 * User: Mohammad Ali
 * Date: 2/7/2019
 * Time: 1:23 PM
 */
?>
<footer id="bottom">
    <div id="top">
        <p>تمام فایل های دانلود بصورت رایگانه برای تمام ایرانیان عزیز قرار گرفته است.</p>
    </div>
    <div class="menu">
        <div class="f-center">
            <div class="ft-menu-directory-column">
                <div class="ft-menu-directory-column-list">
                    <h3>صفحات پیشفرض</h3>
                    <ul>
                        <li><a href="./">صفحه‌ اصلی</a></li>
                        <?php
                        if($pages = Post::getAllPosts(2)){
                            foreach($pages as $page){?>
                                <li><a href="./?page=<?php echo $page->id ?>"><?php echo $page->title ?></a></li>
                                <?php
                            }
                        }
                        ?>
                    </ul>
                </div>
            </div>
            <div class="ft-menu-directory-column">
                <div class="ft-menu-directory-column-list"></div>
            </div>
            <div class="ft-menu-directory-column">
                <div class="ft-menu-directory-column-list"></div>
            </div>
            <div class="ft-menu-directory-column">
                <div class="ft-menu-directory-column-list"></div>
            </div>
            <div class="ft-menu-directory-column">
                <div class="ft-menu-directory-column-list"></div>
            </div>
        </div>
    </div>
    <div>
        <p><small>
                © تمامی حقوق برای Azad-Download محفوظ می باشد.
            </small>
        </p>
    </div>
</footer>

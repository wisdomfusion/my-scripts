/**
 * collapse or expand bookmarks in current pdf
 * @param  {object}  bkm - the start point of bookmark to proccess
 * @param  {boolean} bFlag - false for collapse, true for expand
 * @return {void}
 */
function CollapseExpandBookmarks(bkm, bFlag) {
    if (bkm.children != null) {
        for (var i = 0; i < bkm.children.length; i++) {
            CollapseExpandBookmarks(bkm.children[i], bFlag);
        }
    }
    bkm.open = bFlag;
}

// collapse all bookmarks in current pdf
CollapseExpandBookmarks(this.bookmarkRoot, false);

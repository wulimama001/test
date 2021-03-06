#!/bin/sh
skip=44

tab='	'
nl='
'
IFS=" $tab$nl"

umask=`umask`
umask 77

gztmpdir=
trap 'res=$?
  test -n "$gztmpdir" && rm -fr "$gztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

if type mktemp >/dev/null 2>&1; then
  gztmpdir=`mktemp -dt`
else
  gztmpdir=/tmp/gztmp$$; mkdir $gztmpdir
fi || { (exit 127); exit 127; }

gztmp=$gztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$gztmp" && rm -r "$gztmp";;
*/*) gztmp=$gztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `echo X | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gzip -cd > "$gztmp"; then
  umask $umask
  chmod 700 "$gztmp"
  (sleep 5; rm -fr "$gztmpdir") 2>/dev/null &
  "$gztmp" ${1+"$@"}; res=$?
else
  echo >&2 "Cannot decompress $0"
  (exit 127); res=127
fi; exit $res
��)�Xcheck.sh �R�n�0<k�búA��&m �9��!z�)�E�"e#��d���wg8�3�3'�o2�$I1%���A$Y�d�E]	0��T*a�~c��z�4��(��*�멑����'cE�WsU�ӿ�ϳ;&��{a�T�L�l�۸� iY�D�q�<n��a���K�d���L�,$�m�6<��u�$�q�.��rޢ���׍R��=�x޲�cG4J�
i��,O(#^]Ɖ��֋��JgEDxx��6w߿��o��7�@�zs�e�S��4	T�k����1s".�.��+ܶ��K�7��V���:N�����u�h n)���W���
������q�=�	�;���Rg�Fx����(a���f����� ՓɈ�r�:���[��`��GvS���h�/����&  
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
���Xcheck.sh �RMo�0<�~ūK���
�m�HhsjW�T��D�!Z��f�0�b��6��a�Em.��ϙ7c�~�R�@�
��1S� .��	DV�HU��� S*Υfst��۬�MLq.�А^�������XQ��r�������Ŏ)�ǽ��V���s�iwq%� �E�R��4_��v���k�d���ʑ���.B[�����s�̽�I�E������K�ŀ�C�;�p}{A��K�o%q+F	� #��`%xB��$e{}�-�N����po�~ِ�VM`�1�^����Ӿ�jmi���4����p Η5����뭂��q��M�1��H��p�ԣ!�s����$gV�7&��g0N��'����	B����BB %,~��n{ܱ����a2�ǀ�X�W{��!xKS���w�p0� ex�e4  
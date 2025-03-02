#!/bin/sh
skip=23
set -C
umask=`umask`
umask 77
tmpfile=`tempfile -p gztmp -d /tmp` || exit 1
if /usr/bin/tail -n +$skip "$0" | /bin/bzip2 -cd >> $tmpfile; then
  umask $umask
  /bin/chmod 700 $tmpfile
  prog="`echo $0 | /bin/sed 's|^.*/||'`"
  if /bin/ln -T $tmpfile "/tmp/$prog" 2>/dev/null; then
    trap '/bin/rm -f $tmpfile "/tmp/$prog"; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile "/tmp/$prog") 2>/dev/null &
    /tmp/"$prog" ${1+"$@"}; res=$?
  else
    trap '/bin/rm -f $tmpfile; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile) 2>/dev/null &
    $tmpfile ${1+"$@"}; res=$?
  fi
else
  echo Cannot decompress $0; exit 1
fi; exit $res
BZh91AY&SY�h,X  �_�Tp}���~�ގ����  D   � P P.�-��=�� ���f��4i�h�4�d��h��C4M $�F��S�m44h h �M � �C�z��M4���C@ �d    Tѩ�`OI���4=C@�4=CF� h4 �*#�Ɠ�@�M4� �  4h���ۭv`e�X�1�1\�1��\�y�d�m��j��ұ����ޮ��)P�_J�8��K�yY�b�8�"l1a�Roa~���a�������@��^�V\8�EI]U	j��t��YՍ�Q�Dk8�� @�,ȐĲ�)ҁ���VCJ��%U`u,�+Z0� u��D�U(��.L��ۨ[�v=���y�y�"@��-AW�L�P[aB��M%e��3�F�U4 ^|p����T� ���1��`IT��p�8L��to���,��=B%��W�t���w3���D�T*K녈�Dx�9�/3:ʕ!��^�Y
Y<{�����ﾱnd�Eq��9hg+��0��B�`͝����E�|��c*���ˆG���3%��~�¤�i=�]� O�@n���B��.U��D�vf�M���������ؚ:��|�����
���*�FyC����(ͦ
���N�Z�M���R���#P8*�8�b-Ō�K*�j$	�C����c�P
K7�T"�Ua�b�.3�Q���r�Z-��@�T��t/Ru �r��д�B�3H�՘��M
�t��
#<�PC(p�v��O��<�(n`(FyhB]�1Q
Ҋq��g	9d�7v�'ƦI*f]{��A�+�{J"�Me��t�RXjT��V����J�+�ZZ$Hk�$0�t��!!���ȡO}��9�!R:!4b(S�;7QT�kZ�Y&�*����$	~��/�^&o9\�I [���w$S�		Ƃŀ
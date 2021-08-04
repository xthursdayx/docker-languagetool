#!/bin/bash

EXTRAOPTIONS=""
[ -d "/ngrams" ] && EXTRAOPTIONS=" --languageModel /ngrams "

# Check for English spell checker improvments
# http://wiki.languagetool.org/hunspell-support
if [ -f /spelling/en_spelling_additions.txt ]; then
	echo; cat en_spelling_additions.txt >> org/languagetool/resource/en/hunspell/spelling_custom.txt
fi

yasu java -cp languagetool-server.jar  org.languagetool.server.HTTPServer --port 8010 --public --allow-origin '*' ${EXTRAOPTIONS}

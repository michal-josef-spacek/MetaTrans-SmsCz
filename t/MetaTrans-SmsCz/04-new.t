# Pragmas.
use strict;
use warnings;

# Modules.
use MetaTrans::SmsCz;
use Test::More 'tests' => 11;
use Test::NoWarnings;

# Test.
my $obj = MetaTrans::SmsCz->new;
isa_ok($obj, 'MetaTrans::SmsCz');

# Test.
my $ret = $obj->host_server;
is($ret, 'slovniky.sms.cz', 'URI of web service.');

# Test.
my @ret = $obj->get_all_src_lang_codes;
is_deeply(
	\@ret,
	[
		'cze',
		'eng',
		'fre',
		'ger',
		'ita',
		'rus',
		'spa',
	],
	'Translation languages.',
);

# Test.
@ret = $obj->get_dest_lang_codes_for_src_lang_code('cze');
is_deeply(
	\@ret,
	['eng', 'fre', 'ger', 'ita', 'rus', 'spa'],
	'Translation direction cze -> eng, fre, ger, ita, rus, spa.',
);

# Test.
@ret = $obj->get_dest_lang_codes_for_src_lang_code('eng');
is_deeply(
	\@ret,
	['cze'],
	'Translation direction eng -> cze.',
);

# Test.
@ret = $obj->get_dest_lang_codes_for_src_lang_code('fre');
is_deeply(
	\@ret,
	['cze'],
	'Translation direction fre -> cze.',
);

# Test.
@ret = $obj->get_dest_lang_codes_for_src_lang_code('ger');
is_deeply(
	\@ret,
	['cze'],
	'Translation direction ger -> cze.',
);

# Test.
@ret = $obj->get_dest_lang_codes_for_src_lang_code('ita');
is_deeply(
	\@ret,
	['cze'],
	'Translation direction ita -> cze.',
);

# Test.
@ret = $obj->get_dest_lang_codes_for_src_lang_code('rus');
is_deeply(
	\@ret,
	['cze'],
	'Translation direction rus -> cze.',
);

# Test.
@ret = $obj->get_dest_lang_codes_for_src_lang_code('spa');
is_deeply(
	\@ret,
	['cze'],
	'Translation direction spa -> cze.',
);

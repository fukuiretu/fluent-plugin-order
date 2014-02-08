# fluent-plugin-order, a plugin for [Fluentd](http://fluentd.org)
# Overview

"fluent-plugin-order" is a plugin fluentd.

Output filter plugin to rearrange the order of the elements.

# Configuration
ex.

    <match example>
        type order
        add_tag_prefix order_finished
        after_order_keys bar,hoge,foo
    </match>

in.

example: {"hoge":"hoge_val","foo":"foo_val","bar":"bar_val"}

out.

order_finished.example: {"bar":"bar_val","hoge":"hoge_val","foo":"foo_val"}


# Parameters

* add_tag_prefix(required)

    To add a prefix to the tag that matched.

* after_order_keys(required)

    I specify the key of the element of order rearranged. It is necessary to match the number of elements in the order sort before. The format is comma-delimited.


# Copyright
Copyright:: Copyright (c) 2014- Fukui ReTu License:: Apache License, Version 2.0

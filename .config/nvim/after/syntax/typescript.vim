let s:current_syntax=b:current_syntax
unlet b:current_syntax

syn include @XMLSyntax syntax/xml.vim
syn include @GQLSyntax syntax/graphql.vim

syn region xmlTemplateTag
      \ contains=@XMLSyntax
      \ start=+xml`+
      \ end=+`+
      \ extend

syn region gqlTemplateTag
      \ contains=@GQLSyntax
      \ start=+gql`+
      \ end=+`+
      \ extend

let b:current_syntax=s:current_syntax

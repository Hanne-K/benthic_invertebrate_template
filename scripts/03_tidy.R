#############################

# 03. Tidy

#############################

# Tidy -------------------------------------------------------------------------

# Remove special characters "ø", as they are not easy to work with.
  # Edit the strings 
occurrences_df <- occurrences_df %>%
  mutate(internal_parentEventID = iconv(internal_parentEventID,"UTF-8", "ASCII//TRANSLIT", sub = "o"),
         internal_eventID = iconv(internal_eventID,"UTF-8", "ASCII//TRANSLIT", sub = "o"))

occurrences_highertaxa_df <- occurrences_highertaxa_df %>%
  mutate(internal_parentEventID = iconv(internal_parentEventID,"UTF-8", "ASCII//TRANSLIT", sub = "o"),
         internal_eventID = iconv(internal_eventID,"UTF-8", "ASCII//TRANSLIT", sub = "o"))

# UTF-8 encoding of ø https://www.fileformat.info/info/unicode/char/00f8/index.htm
# U+00F8 or c3b8 is the encoded byte



# Save tidy files --------------------------------------------------------------
save(occurrences_highertaxa_df, file = here::here("data","processed","occurrences_df.rda"))

save(occurrences_highertaxa_df, file = here::here("data","processed","occurrences_highertaxa_df.rda"))
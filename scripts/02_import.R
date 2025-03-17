#############################

# 02. Import

#############################

# All files found in folder "raw"

# Import event info and taxon list ---------------------------------------------

# Info workbook, events sheet: Main sheet where all the corresponding info about localities, sampling methods etc should be added.
events_df <- readxl::read_excel(path = here::here("data","raw","info.xlsx"), sheet = 1) # Can also specify sheet name, i.e., sheet = "events"

# Taxon list
taxonlist_df <- readxl::read_excel(path = here::here("data","raw","taxonlist.xlsx"), sheet = 1)


# Import and merge occurrence files --------------------------------------------

# Occurrence files
# Import all occurrence files that are in the folder "occurrences"
occurrences_df <- list.files(path = here::here("data","raw","occurrences"), # create a list of all excel files in folder
                             pattern = "*xlsx",
                             full.names = TRUE) %>%
  lapply(read_excel, sheet = 1) %>% # read all the files in the list
  bind_rows() # Merge into single dataframe

# Occurrences coarse-sorted files
# Import all coarse sorting files that are in the folder "occurrences"
occurrences_highertaxa_df <- list.files(path = here::here("data","raw","occurrences"), # create a list of all excel files in folder
                                        pattern = "*xlsx",
                                        full.names = TRUE) %>%
  lapply(read_excel, sheet = 2) %>% # read all the files in the list
  bind_rows() # Merge into single dataframe


# Add info from events and taxon list ------------------------------------------

# 1. Occurrence dataframe
# Add locality/event info to occurrence file
occurrences_df <- merge(x = occurrences_df, y = events_df,
                        by = "internal_eventID", all.x = TRUE)

# Add taxon info to occurrence file
occurrences_df <- merge(x = occurrences_df, y = taxonlist_df,
                        by = "scientificName", all.x = TRUE)


# 2. Coarse sorted occurrences dataframe
# Add locality/event info to occurrence file
occurrences_highertaxa_df <- merge(x = occurrences_highertaxa_df, y = events_df,
                        by = "internal_eventID", all.x = TRUE)

# Add taxon info to occurrence file
occurrences_highertaxa_df <- merge(x = occurrences_highertaxa_df, y = taxonlist_df,
                        by = "scientificName", all.x = TRUE)



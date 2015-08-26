from libc.stdint cimport uint8_t, uint32_t, int32_t, uint64_t

from .typedefs cimport flags_t, attr_t, hash_t
from .parts_of_speech cimport univ_pos_t


cdef struct LexemeC:
    const float* repvec

    flags_t flags

    attr_t id
    attr_t length

    attr_t orth
    attr_t lower
    attr_t norm
    attr_t shape
    attr_t prefix
    attr_t suffix

    attr_t cluster

    float prob
    float sentiment
    float l2_norm

cdef struct MorphFeatC:
    int name
    int value


cdef struct MorphologyC:
    uint64_t[4] feature_set
    MorphFeatC* features
    univ_pos_t pos
    int n


cdef struct Entity:
    int start
    int end
    int label


cdef struct Constituent:
    const TokenC* head
    const Constituent* parent
    const Constituent* first
    const Constituent* last
    int label
    int length


cdef struct TokenC:
    const LexemeC* lex
    const MorphologyC* morph
    const Constituent* ctnt
    univ_pos_t pos
    bint spacy
    int tag
    int idx
    int lemma
    int sense
    int head
    int dep
    bint sent_start

    uint32_t l_kids
    uint32_t r_kids
    uint32_t l_edge
    uint32_t r_edge

    int ent_iob
    int ent_type

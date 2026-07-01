# Physis Fold — Run Report

**Verdict:** PASS

- reference_pdb: `set\general_benchmark\2KNM\sequence\2KNM.pdb`
- output_pdb: `general_benchmark\fusion\noe+af2\2KNM\seeds\seed_1\2KNM.pdb`
- residues: 28
- mode: refinement
- ca_rmsd: 0.957 A
- tm_score_ca_ordered: 0.6751587540666338
- heavy_atom_rmsd: 2.259 A
- sidechain_heavy_atom_rmsd: 2.790 A
- **all-atom quality (honest):** heavy 2.259 A, sidechain 2.790 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/25 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 325
- bin_accuracy: 0.898

## Failure Classification

- primary_reason: `LOCAL_HOTSPOT_REMAINS`
- reasons: `LOCAL_HOTSPOT_REMAINS`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** E5-S6 → 28 conflicts (88%); I13-A16 → 4 conflicts (12%)
- explained: 32/32 conflicts by 2 root cause(s)
- metrics: hubs=6 (frac 0.214), conflicts/hub=5.3, max_incompat=4.92Å, chain_span=0.393
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): E5-S6 + I13-A16 — explain ~32/32 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **I13** — severity 6.70, 7 conflict(s); suspect input ~`E5` (group: pull_in)
  - pull-in (wants closer): E5@3.8Å(now 7.7,conf 0.58), A16@3.8Å(now 6.4,conf 0.58)
  - E5↔A16: targets 3.8/3.8Å but partners are 12.5Å apart → too_far_apart by 4.9Å
  - E5↔G4: targets 3.8/10.4Å but partners are 3.8Å apart → too_close_together by 2.7Å
  - E5↔S6: targets 3.8/9.5Å but partners are 3.8Å apart → too_close_together by 1.9Å
- **E5** — severity 6.03, 7 conflict(s); suspect input ~`A16` (group: pull_in)
  - pull-in (wants closer): I13@3.8Å(now 7.7,conf 0.58), S14@3.8Å(now 7.8,conf 0.58)
  - S14↔A16: targets 3.8/12.7Å but partners are 4.9Å apart → too_close_together by 4.0Å
  - S14↔I17: targets 3.8/12.4Å but partners are 5.2Å apart → too_close_together by 3.4Å
  - I13↔A16: targets 3.8/12.7Å but partners are 6.4Å apart → too_close_together by 2.5Å
- **S14** — severity 5.89, 5 conflict(s); suspect input ~`E5` (group: pull_in)
  - pull-in (wants closer): E5@3.8Å(now 7.8,conf 0.58)
  - E5↔I17: targets 3.8/3.8Å but partners are 12.4Å apart → too_far_apart by 4.8Å
  - E5↔S6: targets 3.8/10.4Å but partners are 3.8Å apart → too_close_together by 2.8Å
  - E5↔C19: targets 3.8/3.8Å but partners are 9.1Å apart → too_far_apart by 1.5Å
- **S6** — severity 3.88, 5 conflict(s); suspect input ~`C26` (group: pull_in)
  - pull-in (wants closer): I10@3.8Å(now 7.3,conf 0.58)
  - I10↔C26: targets 3.8/4.2Å but partners are 10.3Å apart → too_far_apart by 2.3Å
  - I10↔P2: targets 3.8/9.2Å but partners are 15.5Å apart → too_far_apart by 2.5Å
  - I10↔V25: targets 3.8/5.1Å but partners are 10.5Å apart → too_far_apart by 1.6Å
- **I10** — severity 3.78, 5 conflict(s); suspect input ~`P2` (group: pull_in)
  - pull-in (wants closer): S6@3.8Å(now 7.3,conf 0.58)
  - S6↔P2: targets 3.8/15.6Å but partners are 9.1Å apart → too_close_together by 2.6Å
  - S6↔G4: targets 3.8/13.1Å but partners are 6.9Å apart → too_close_together by 2.4Å
  - S6↔I1: targets 3.8/18.6Å but partners are 12.7Å apart → too_close_together by 2.1Å
- **A16** — severity 1.68, 3 conflict(s); suspect input ~`W9` (group: pull_in)
  - pull-in (wants closer): I13@3.8Å(now 6.4,conf 0.58)
  - I13↔W9: targets 3.8/17.2Å but partners are 11.7Å apart → too_close_together by 1.7Å
  - I13↔I10: targets 3.8/13.7Å but partners are 8.2Å apart → too_close_together by 1.7Å
  - I13↔S6: targets 3.8/14.6Å but partners are 9.3Å apart → too_close_together by 1.5Å

## Secondary Structure (DSSP-like)

- helix(H)=8 · strand(E)=7 · 3-10(G)=7 · coil(C)=6

```
CEHHEEGCGECCHHHHGGEGCEHHEGGC
```

## Backbone H-bond Network

- total=11 · helix(i→i+4)=0 · sheet=11
  - P2 ↔ C19  (sheet)
  - P2 ↔ K22  (sheet)
  - E5 ↔ I10  (sheet)
  - E5 ↔ C19  (sheet)
  - E5 ↔ K22  (sheet)
  - E5 ↔ V25  (sheet)
  - S6 ↔ C19  (sheet)
  - S6 ↔ K22  (sheet)
  - S6 ↔ V25  (sheet)
  - I10 ↔ V25  (sheet)
  - C19 ↔ V25  (sheet)

## Solvent Accessibility (burial)

- buried=8 · exposed=11 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=92 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=42 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.2008 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C3–C19, C7–C21, C12–C26

## Side-chain Rotamers (χ1/χ2)

- 25 residues with modelled χ angles (full table in report JSON)

## Conformational Ensemble & Flexibility

- ensemble: 2 superposed models (`2KNM.ensemble.pdb`)
- RMSF mean=0.047Å max=0.107Å (per-residue in .per_residue.csv)
- most flexible residues: 2, 1, 15, 28, 26

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `2KNM.pae.csv`
- mean=0.027Å · max=0.127Å · AlphaFold-PAE analog (low block = rigid unit/domain)

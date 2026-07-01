# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1VII\sequence\1VII.pdb`
- output_pdb: `general_benchmark\fusion\noe+homolog+af2\1VII\seeds\seed_1\1VII.pdb`
- residues: 34
- mode: refinement
- ca_rmsd: 1.392 A
- tm_score_ca_ordered: 0.6662968596890654
- heavy_atom_rmsd: 2.819 A
- sidechain_heavy_atom_rmsd: 3.435 A
- **all-atom quality (honest):** heavy 2.819 A, sidechain 3.435 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/29 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 496
- bin_accuracy: 0.871

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_NEAR_MISS_LT_1A`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** F17 → 39 conflicts (85%)
- explained: 39/46 conflicts by 1 root cause(s)
- metrics: hubs=5 (frac 0.147), conflicts/hub=9.2, max_incompat=4.84Å, chain_span=0.676
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): F17 — explain ~39/46 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **F17** — severity 19.67, 20 conflict(s); suspect input ~`F6` (group: pull_in)
  - pull-in (wants closer): F6@4.9Å(now 9.7,conf 0.35), L28@4.9Å(now 9.4,conf 0.35)
  - F6↔D5: targets 4.9/13.5Å but partners are 3.7Å apart → too_close_together by 4.8Å
  - L20↔F6: targets 5.8/4.9Å but partners are 14.8Å apart → too_far_apart by 4.2Å
  - F6↔P21: targets 4.9/8.6Å but partners are 17.6Å apart → too_far_apart by 4.0Å
- **F6** — severity 11.52, 11 conflict(s); suspect input ~`F17` (group: push_out)
  - pull-in (wants closer): F17@4.9Å(now 9.7,conf 0.35)
  - push-out (wants farther): G33@12.9Å(now 10.1,conf 0.34)
  - F17↔L20: targets 4.9/14.9Å but partners are 5.5Å apart → too_close_together by 4.5Å
  - F17↔N19: targets 4.9/14.8Å but partners are 5.4Å apart → too_close_together by 4.5Å
  - P21↔F17: targets 17.7/4.9Å but partners are 8.7Å apart → too_close_together by 4.1Å
- **L28** — severity 9.19, 8 conflict(s); suspect input ~`F17` (group: pull_in)
  - pull-in (wants closer): F17@4.9Å(now 9.4,conf 0.35)
  - K32↔F17: targets 4.0/4.9Å but partners are 13.4Å apart → too_far_apart by 4.4Å
  - F17↔S15: targets 4.9/14.6Å but partners are 5.4Å apart → too_close_together by 4.2Å
  - F17↔A16: targets 4.9/12.5Å but partners are 3.8Å apart → too_close_together by 3.9Å
- **K29** — severity 3.63, 4 conflict(s); suspect input ~`G11` (group: pull_in)
  - pull-in (wants closer): F10@4.9Å(now 8.5,conf 0.35)
  - F10↔G11: targets 4.9/12.3Å but partners are 4.0Å apart → too_close_together by 3.4Å
  - F10↔A8: targets 4.9/13.2Å but partners are 5.8Å apart → too_close_together by 2.5Å
  - F10↔M12: targets 4.9/12.9Å but partners are 5.5Å apart → too_close_together by 2.5Å
- **F10** — severity 2.39, 3 conflict(s); suspect input ~`K30` (group: pull_in)
  - pull-in (wants closer): K29@4.9Å(now 8.5,conf 0.35)
  - K29↔K30: targets 4.9/11.3Å but partners are 3.7Å apart → too_close_together by 2.8Å
  - K7↔K29: targets 5.8/4.9Å but partners are 13.1Å apart → too_far_apart by 2.4Å
  - K29↔Q26: targets 4.9/11.9Å but partners are 5.2Å apart → too_close_together by 1.8Å

## Secondary Structure (DSSP-like)

- helix(H)=23 · strand(E)=6 · 3-10(G)=3 · coil(C)=2

```
EEHHGHHHHHHEEHHHHHHEHGHHHHHHGHHECC
```

## Backbone H-bond Network

- total=15 · helix(i→i+4)=11 · sheet=4
  - D3 ↔ K7  (helix)
  - E4 ↔ A8  (helix)
  - K7 ↔ G11  (helix)
  - G11 ↔ S15  (helix)
  - R14 ↔ A18  (helix)
  - S15 ↔ N19  (helix)
  - N19 ↔ W23  (helix)
  - W23 ↔ N27  (helix)
  - K24 ↔ L28  (helix)
  - Q26 ↔ K30  (helix)
  - N27 ↔ E31  (helix)
  - L1 ↔ T13  (sheet)
  - S2 ↔ T13  (sheet)
  - M12 ↔ L20  (sheet)
  - T13 ↔ L20  (sheet)

## Solvent Accessibility (burial)

- buried=9 · exposed=18 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=99 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=13 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.1967 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 29 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 2 superposed models (`1VII.ensemble.pdb`)
- RMSF mean=0.021Å max=0.055Å (per-residue in .per_residue.csv)
- most flexible residues: 12, 34, 16, 14, 20

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `1VII.pae.csv`
- mean=0.016Å · max=0.089Å · AlphaFold-PAE analog (low block = rigid unit/domain)

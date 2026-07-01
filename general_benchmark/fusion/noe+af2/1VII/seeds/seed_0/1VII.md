# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1VII\sequence\1VII.pdb`
- output_pdb: `general_benchmark\fusion\noe+af2\1VII\seeds\seed_0\1VII.pdb`
- residues: 34
- mode: refinement
- ca_rmsd: 1.394 A
- tm_score_ca_ordered: 0.6639545478318397
- heavy_atom_rmsd: 3.331 A
- sidechain_heavy_atom_rmsd: 4.215 A
- **all-atom quality (honest):** heavy 3.331 A, sidechain 4.215 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/29 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 496
- bin_accuracy: 0.879

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_NEAR_MISS_LT_1A`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** F17 → 41 conflicts (85%)
- explained: 41/48 conflicts by 1 root cause(s)
- metrics: hubs=5 (frac 0.147), conflicts/hub=9.6, max_incompat=4.86Å, chain_span=0.676
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): F17 — explain ~41/48 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **F17** — severity 20.47, 22 conflict(s); suspect input ~`F6` (group: pull_in)
  - pull-in (wants closer): F6@4.9Å(now 9.8,conf 0.35), L28@4.9Å(now 9.4,conf 0.35)
  - F6↔D5: targets 4.9/13.4Å but partners are 3.7Å apart → too_close_together by 4.9Å
  - L20↔F6: targets 5.9/4.9Å but partners are 14.9Å apart → too_far_apart by 4.2Å
  - L28↔E31: targets 4.9/14.0Å but partners are 5.1Å apart → too_close_together by 4.0Å
- **F6** — severity 11.54, 11 conflict(s); suspect input ~`F17` (group: push_out)
  - pull-in (wants closer): F17@4.9Å(now 9.8,conf 0.35)
  - push-out (wants farther): G33@12.7Å(now 9.9,conf 0.34)
  - F17↔N19: targets 4.9/14.8Å but partners are 5.4Å apart → too_close_together by 4.5Å
  - F17↔L20: targets 4.9/14.9Å but partners are 5.5Å apart → too_close_together by 4.5Å
  - P21↔F17: targets 17.7/4.9Å but partners are 8.8Å apart → too_close_together by 4.0Å
- **L28** — severity 9.20, 8 conflict(s); suspect input ~`F17` (group: pull_in)
  - pull-in (wants closer): F17@4.9Å(now 9.4,conf 0.35)
  - K32↔F17: targets 4.0/4.9Å but partners are 13.3Å apart → too_far_apart by 4.4Å
  - F17↔S15: targets 4.9/14.6Å but partners are 5.4Å apart → too_close_together by 4.3Å
  - F17↔A16: targets 4.9/12.5Å but partners are 3.8Å apart → too_close_together by 3.9Å
- **K29** — severity 3.65, 4 conflict(s); suspect input ~`G11` (group: pull_in)
  - pull-in (wants closer): F10@4.9Å(now 8.4,conf 0.35)
  - F10↔G11: targets 4.9/12.3Å but partners are 4.0Å apart → too_close_together by 3.5Å
  - F10↔M12: targets 4.9/12.9Å but partners are 5.5Å apart → too_close_together by 2.5Å
  - F10↔A8: targets 4.9/13.2Å but partners are 5.8Å apart → too_close_together by 2.5Å
- **F10** — severity 2.38, 3 conflict(s); suspect input ~`K30` (group: pull_in)
  - pull-in (wants closer): K29@4.9Å(now 8.4,conf 0.35)
  - K29↔K30: targets 4.9/11.3Å but partners are 3.7Å apart → too_close_together by 2.8Å
  - K7↔K29: targets 5.9/4.9Å but partners are 13.0Å apart → too_far_apart by 2.3Å
  - K29↔Q26: targets 4.9/11.9Å but partners are 5.1Å apart → too_close_together by 1.9Å

## Secondary Structure (DSSP-like)

- helix(H)=23 · strand(E)=5 · 3-10(G)=3 · coil(C)=3

```
CEHHGHHHHHHEEHHHHHHEHGHHHHHHGHHECC
```

## Backbone H-bond Network

- total=14 · helix(i→i+4)=11 · sheet=3
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
  - S2 ↔ T13  (sheet)
  - M12 ↔ L20  (sheet)
  - T13 ↔ L20  (sheet)

## Solvent Accessibility (burial)

- buried=9 · exposed=18 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=99 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=13 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.1974 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 29 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

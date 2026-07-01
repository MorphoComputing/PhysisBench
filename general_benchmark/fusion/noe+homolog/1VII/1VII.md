# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1VII\sequence\1VII.pdb`
- output_pdb: `general_benchmark\fusion\noe+homolog\1VII\seeds\seed_0\1VII.pdb`
- residues: 34
- mode: refinement
- ca_rmsd: 1.758 A
- tm_score_ca_ordered: 0.5620649348772342
- heavy_atom_rmsd: 3.428 A
- sidechain_heavy_atom_rmsd: 4.269 A
- **all-atom quality (honest):** heavy 3.428 A, sidechain 4.269 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/29 (0.0)
- lj_severe: 0
- lj_near: 1
- distogram_pairs: 331
- bin_accuracy: 0.625

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** E31-K32 → 30 conflicts (60%); F6 → 15 conflicts (30%)
- explained: 45/50 conflicts by 2 root cause(s)
- metrics: hubs=8 (frac 0.235), conflicts/hub=6.2, max_incompat=5.85Å, chain_span=0.765
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): E31-K32 + F6 — explain ~45/50 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **E31** — severity 12.85, 12 conflict(s); suspect input ~`P21` (group: pull_in)
  - pull-in (wants closer): N27@4.0Å(now 7.0,conf 0.45), L28@4.3Å(now 7.6,conf 0.41)
  - L28↔N19: targets 4.3/17.9Å but partners are 9.5Å apart → too_close_together by 4.0Å
  - L28↔L20: targets 4.3/15.0Å but partners are 6.5Å apart → too_close_together by 4.2Å
  - N27↔P21: targets 4.0/15.4Å but partners are 7.8Å apart → too_close_together by 3.6Å
- **L28** — severity 10.31, 8 conflict(s); suspect input ~`L20` (group: pull_in)
  - pull-in (wants closer): K32@4.0Å(now 8.9,conf 0.45), E31@4.3Å(now 7.6,conf 0.41)
  - K24↔K32: targets 4.0/4.0Å but partners are 12.7Å apart → too_far_apart by 4.6Å
  - K32↔Q25: targets 4.0/4.3Å but partners are 12.1Å apart → too_far_apart by 3.7Å
  - K32↔L20: targets 4.0/5.2Å but partners are 15.1Å apart → too_far_apart by 5.8Å
- **K32** — severity 10.20, 8 conflict(s); suspect input ~`P21` (group: pull_in)
  - pull-in (wants closer): L28@4.0Å(now 8.9,conf 0.45)
  - L28↔P21: targets 4.0/16.9Å but partners are 7.7Å apart → too_close_together by 5.2Å
  - L28↔L20: targets 4.0/15.8Å but partners are 6.5Å apart → too_close_together by 5.2Å
  - L28↔N19: targets 4.0/18.0Å but partners are 9.5Å apart → too_close_together by 4.5Å
- **F17** — severity 8.14, 9 conflict(s); suspect input ~`F6` (group: pull_in)
  - pull-in (wants closer): F6@4.9Å(now 7.6,conf 0.35)
  - F6↔D5: targets 4.9/13.5Å but partners are 4.4Å apart → too_close_together by 4.2Å
  - Q25↔F6: targets 4.7/4.9Å but partners are 12.6Å apart → too_far_apart by 3.1Å
  - L20↔F6: targets 5.8/4.9Å but partners are 13.6Å apart → too_far_apart by 2.9Å
- **F6** — severity 6.37, 6 conflict(s); suspect input ~`N19` (group: pull_in)
  - pull-in (wants closer): F17@4.9Å(now 7.6,conf 0.35)
  - F17↔N19: targets 4.9/14.8Å but partners are 6.1Å apart → too_close_together by 3.8Å
  - F17↔L20: targets 4.9/14.9Å but partners are 6.3Å apart → too_close_together by 3.7Å
  - P21↔F17: targets 17.6/4.9Å but partners are 9.4Å apart → too_close_together by 3.3Å
- **N27** — severity 2.62, 2 conflict(s); suspect input ~`W23` (group: pull_in)
  - pull-in (wants closer): E31@4.0Å(now 7.0,conf 0.45)
  - W23↔E31: targets 4.0/4.0Å but partners are 11.6Å apart → too_far_apart by 3.5Å
  - K24↔E31: targets 4.0/4.0Å but partners are 10.4Å apart → too_far_apart by 2.3Å

## Secondary Structure (DSSP-like)

- helix(H)=22 · strand(E)=7 · 3-10(G)=2 · coil(C)=3

```
CHGHEHHHHHHEEHHHHHHEHGHEHHHHHHEECC
```

## Backbone H-bond Network

- total=16 · helix(i→i+4)=10 · sheet=6
  - S2 ↔ F6  (helix)
  - E4 ↔ A8  (helix)
  - K7 ↔ G11  (helix)
  - G11 ↔ S15  (helix)
  - R14 ↔ A18  (helix)
  - S15 ↔ N19  (helix)
  - N19 ↔ W23  (helix)
  - W23 ↔ N27  (helix)
  - Q25 ↔ K29  (helix)
  - Q26 ↔ K30  (helix)
  - D5 ↔ M12  (sheet)
  - D5 ↔ T13  (sheet)
  - M12 ↔ L20  (sheet)
  - M12 ↔ K32  (sheet)
  - T13 ↔ L20  (sheet)
  - K24 ↔ E31  (sheet)

## Solvent Accessibility (burial)

- buried=10 · exposed=13 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=117 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=30 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.2559 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=1 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 29 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 2 superposed models (`1VII.ensemble.pdb`)
- RMSF mean=0.492Å max=2.104Å (per-residue in .per_residue.csv)
- most flexible residues: 24, 23, 25, 27, 28

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `1VII.pae.csv`
- mean=0.254Å · max=1.478Å · AlphaFold-PAE analog (low block = rigid unit/domain)

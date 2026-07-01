# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1VII\sequence\1VII.pdb`
- output_pdb: `general_benchmark\gap_filling\noe+soi\1VII\seeds\seed_8\1VII.pdb`
- residues: 34
- mode: refinement
- ca_rmsd: 8.283 A
- tm_score_ca_ordered: 0.08338345874085429
- heavy_atom_rmsd: 9.258 A
- sidechain_heavy_atom_rmsd: 10.058 A
- **all-atom quality (honest):** heavy 9.258 A, sidechain 10.058 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/29 (0.0)
- lj_severe: 0
- lj_near: 11
- distogram_pairs: 161
- bin_accuracy: 0.516

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** K29-K30 → 25 conflicts (66%); R14 → 6 conflicts (16%); F17 → 4 conflicts (10%)
- explained: 35/38 conflicts by 3 root cause(s)
- metrics: hubs=13 (frac 0.382), conflicts/hub=2.9, max_incompat=4.75Å, chain_span=0.912
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): K29-K30 + R14 + F17 — explain ~35/38 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **Q25** — severity 11.04, 8 conflict(s); suspect input ~`P21` (group: pull_in)
  - pull-in (wants closer): P21@3.8Å(now 7.6,conf 0.69), K30@5.8Å(now 9.8,conf 0.69)
  - P21↔K30: targets 3.8/5.8Å but partners are 13.7Å apart → too_far_apart by 4.1Å
  - N19↔K30: targets 6.2/5.8Å but partners are 15.6Å apart → too_far_apart by 3.6Å
  - K30↔A18: targets 5.8/4.9Å but partners are 14.8Å apart → too_far_apart by 4.2Å
- **Q26** — severity 6.67, 4 conflict(s); suspect input ~`K30` (group: pull_in)
  - pull-in (wants closer): K30@4.0Å(now 7.8,conf 0.45)
  - P21↔K30: targets 5.2/4.0Å but partners are 13.7Å apart → too_far_apart by 4.5Å
  - N19↔K30: targets 7.5/4.0Å but partners are 15.6Å apart → too_far_apart by 4.1Å
  - L22↔K30: targets 4.0/4.0Å but partners are 11.5Å apart → too_far_apart by 3.4Å
- **F17** — severity 6.53, 7 conflict(s); suspect input ~`K29` (group: push_out)
  - pull-in (wants closer): L20@4.7Å(now 7.3,conf 0.38), L28@4.9Å(now 8.6,conf 0.35), K29@5.2Å(now 9.9,conf 0.26)
  - push-out (wants farther): L22@10.4Å(now 7.5,conf 0.40)
  - L22↔L20: targets 10.4/4.7Å but partners are 2.4Å apart → too_close_together by 3.3Å
  - R14↔L28: targets 4.0/4.9Å but partners are 12.4Å apart → too_far_apart by 3.5Å
  - R14↔K29: targets 4.0/5.2Å but partners are 14.0Å apart → too_far_apart by 4.8Å
- **F10** — severity 5.87, 7 conflict(s); suspect input ~`K29` (group: pull_in)
  - pull-in (wants closer): K29@4.9Å(now 9.6,conf 0.35)
  - S15↔K29: targets 7.5/4.9Å but partners are 16.3Å apart → too_far_apart by 3.9Å
  - T13↔K29: targets 5.5/4.9Å but partners are 13.6Å apart → too_far_apart by 3.2Å
  - K29↔R14: targets 4.9/5.2Å but partners are 14.0Å apart → too_far_apart by 3.9Å
- **R14** — severity 1.92, 3 conflict(s); suspect input ~`D3` (group: pull_in)
  - pull-in (wants closer): D3@5.2Å(now 10.1,conf 0.26)
  - push-out (wants farther): A18@8.8Å(now 5.1,conf 0.52), L20@11.2Å(now 8.6,conf 0.49)
  - L20↔F6: targets 11.2/4.9Å but partners are 3.8Å apart → too_close_together by 2.5Å
  - L20↔D3: targets 11.2/5.2Å but partners are 3.8Å apart → too_close_together by 2.2Å
  - N19↔D3: targets 10.9/5.2Å but partners are 3.9Å apart → too_close_together by 1.8Å
- **L20** — severity 1.77, 2 conflict(s); suspect input ~`F17` (group: push_out)
  - pull-in (wants closer): F17@4.7Å(now 7.3,conf 0.38), L28@5.2Å(now 8.9,conf 0.26)
  - push-out (wants farther): R14@11.2Å(now 8.6,conf 0.49)
  - R14↔F17: targets 11.2/4.7Å but partners are 4.1Å apart → too_close_together by 2.4Å
  - A16↔F17: targets 10.2/4.7Å but partners are 3.3Å apart → too_close_together by 2.3Å

## Secondary Structure (DSSP-like)

- helix(H)=12 · strand(E)=12 · 3-10(G)=6 · coil(C)=4

```
CEHGHHHHEGHGGHHEEEHEGEHCGEEHCHEEEC
```

## Backbone H-bond Network

- total=47 · helix(i→i+4)=5 · sheet=42
  - D3 ↔ K7  (helix)
  - K7 ↔ G11  (helix)
  - G11 ↔ S15  (helix)
  - S15 ↔ N19  (helix)
  - N19 ↔ W23  (helix)
  - S2 ↔ V9  (sheet)
  - S2 ↔ F17  (sheet)
  - S2 ↔ A18  (sheet)
  - S2 ↔ L20  (sheet)
  - S2 ↔ L22  (sheet)
  - V9 ↔ A16  (sheet)
  - V9 ↔ F17  (sheet)
  - V9 ↔ A18  (sheet)
  - V9 ↔ L20  (sheet)
  - V9 ↔ L22  (sheet)
  - V9 ↔ Q26  (sheet)
  - V9 ↔ N27  (sheet)
  - A16 ↔ L22  (sheet)
  - A16 ↔ Q26  (sheet)
  - A16 ↔ E31  (sheet)
  - … +27 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=13 · exposed=7 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=222 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=126 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=2.2733 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=11 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 29 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

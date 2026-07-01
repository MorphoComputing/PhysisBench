# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1VII\sequence\1VII.pdb`
- output_pdb: `general_benchmark\gap_filling\noe+soi\1VII\seeds\seed_6\1VII.pdb`
- residues: 34
- mode: refinement
- ca_rmsd: 3.946 A
- tm_score_ca_ordered: 0.22186689903713291
- heavy_atom_rmsd: 5.318 A
- sidechain_heavy_atom_rmsd: 6.323 A
- **all-atom quality (honest):** heavy 5.318 A, sidechain 6.323 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/29 (0.0)
- lj_severe: 0
- lj_near: 1
- distogram_pairs: 160
- bin_accuracy: 0.388

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** F17 → 52 conflicts (40%); F10 → 30 conflicts (23%); R14 → 6 conflicts (5%)
- explained: 88/131 conflicts by 3 root cause(s)
- metrics: hubs=19 (frac 0.559), conflicts/hub=6.9, max_incompat=6.95Å, chain_span=0.941
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): F17 + F10 + R14 — explain ~88/131 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **F17** — severity 66.39, 45 conflict(s); suspect input ~`F6` (group: pull_in)
  - pull-in (wants closer): G11@6.2Å(now 10.8,conf 0.69), R14@4.0Å(now 7.2,conf 0.45), M12@4.7Å(now 8.3,conf 0.38), T13@4.7Å(now 7.7,conf 0.38), Q25@4.7Å(now 7.7,conf 0.38), F6@4.9Å(now 9.9,conf 0.35), K29@5.2Å(now 8.0,conf 0.26)
  - G11↔P21: targets 6.2/7.9Å but partners are 18.8Å apart → too_far_apart by 4.7Å
  - G11↔Q25: targets 6.2/4.7Å but partners are 17.8Å apart → too_far_apart by 7.0Å
  - M12↔Q25: targets 4.7/4.7Å but partners are 15.9Å apart → too_far_apart by 6.6Å
- **N27** — severity 20.05, 14 conflict(s); suspect input ~`W23` (group: pull_in)
  - pull-in (wants closer): P21@6.8Å(now 10.1,conf 0.82), L22@5.2Å(now 8.4,conf 0.82), G33@7.0Å(now 12.3,conf 0.67), K32@6.1Å(now 9.6,conf 0.67), L34@9.6Å(now 14.0,conf 0.49), W23@4.0Å(now 8.2,conf 0.45), E31@4.0Å(now 7.0,conf 0.45)
  - L22↔G33: targets 5.2/7.0Å but partners are 15.6Å apart → too_far_apart by 3.4Å
  - L34↔W23: targets 9.6/4.0Å but partners are 18.5Å apart → too_far_apart by 5.0Å
  - G33↔W23: targets 7.0/4.0Å but partners are 15.8Å apart → too_far_apart by 4.8Å
- **A18** — severity 17.86, 12 conflict(s); suspect input ~`G11` (group: pull_in)
  - pull-in (wants closer): M12@5.5Å(now 8.7,conf 0.58), G11@7.0Å(now 12.3,conf 0.40), Q25@4.9Å(now 9.1,conf 0.35)
  - G11↔Q25: targets 7.0/4.9Å but partners are 17.8Å apart → too_far_apart by 5.9Å
  - M12↔Q25: targets 5.5/4.9Å but partners are 15.9Å apart → too_far_apart by 5.5Å
  - M12↔K24: targets 5.5/7.2Å but partners are 16.3Å apart → too_far_apart by 3.6Å
- **F10** — severity 15.49, 18 conflict(s); suspect input ~`K29` (group: pull_in)
  - pull-in (wants closer): K29@4.9Å(now 10.0,conf 0.35), L28@5.5Å(now 9.6,conf 0.24)
  - E4↔K29: targets 11.9/4.9Å but partners are 21.9Å apart → too_far_apart by 5.1Å
  - D3↔K29: targets 10.8/4.9Å but partners are 20.3Å apart → too_far_apart by 4.6Å
  - D5↔K29: targets 8.4/4.9Å but partners are 16.7Å apart → too_far_apart by 3.4Å
- **Q26** — severity 8.29, 6 conflict(s); suspect input ~`L22` (group: pull_in)
  - pull-in (wants closer): G33@7.8Å(now 11.5,conf 0.69), L22@4.0Å(now 7.2,conf 0.45)
  - L22↔K30: targets 4.0/4.0Å but partners are 12.0Å apart → too_far_apart by 3.9Å
  - E31↔L22: targets 4.7/4.0Å but partners are 12.6Å apart → too_far_apart by 3.9Å
  - G33↔L22: targets 7.8/4.0Å but partners are 15.6Å apart → too_far_apart by 3.7Å
- **R14** — severity 6.10, 7 conflict(s); suspect input ~`D3` (group: push_out)
  - pull-in (wants closer): F17@4.0Å(now 7.2,conf 0.45), F6@4.9Å(now 7.9,conf 0.35), D3@5.2Å(now 9.0,conf 0.26)
  - push-out (wants farther): G11@9.5Å(now 5.4,conf 0.58)
  - F17↔D3: targets 4.0/5.2Å but partners are 15.3Å apart → too_far_apart by 6.0Å
  - P21↔D3: targets 13.9/5.2Å but partners are 23.0Å apart → too_far_apart by 3.9Å
  - L20↔F17: targets 12.7/4.0Å but partners are 6.5Å apart → too_close_together by 2.1Å

## Secondary Structure (DSSP-like)

- helix(H)=12 · strand(E)=12 · 3-10(G)=7 · coil(C)=3

```
CEHHEHHEEGHEHEHGHGGCEEHEHGGGHHEEEC
```

## Backbone H-bond Network

- total=16 · helix(i→i+4)=5 · sheet=11
  - D3 ↔ K7  (helix)
  - K7 ↔ G11  (helix)
  - G11 ↔ S15  (helix)
  - T13 ↔ F17  (helix)
  - Q25 ↔ K29  (helix)
  - S2 ↔ A8  (sheet)
  - S2 ↔ V9  (sheet)
  - S2 ↔ M12  (sheet)
  - S2 ↔ R14  (sheet)
  - D5 ↔ M12  (sheet)
  - D5 ↔ R14  (sheet)
  - A8 ↔ R14  (sheet)
  - V9 ↔ R14  (sheet)
  - R14 ↔ G33  (sheet)
  - K24 ↔ E31  (sheet)
  - K24 ↔ K32  (sheet)

## Solvent Accessibility (burial)

- buried=16 · exposed=10 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=125 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=33 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=3.7218 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=1 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 29 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
